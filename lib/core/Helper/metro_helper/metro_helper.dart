import 'dart:collection';

import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/line_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/errors/app_exeption.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/generated/l10n.dart';

final List<String> allStations = [
  "Helwan",
  "Ain Helwan",
  "Helwan University",
  "Wadi Hof",
  "Hadayek Helwan",
  "El-Maasara",
  "Tora El-Asmant",
  "Kozzika",
  "Tora El-Balad",
  "Sakanat El-Maadi",
  "El-Maadi",
  "Hadayek El-Maadi",
  "Dar El-Salam",
  "El-Zahraa",
  "Mar Girgis",
  "El-Malek El-Saleh",
  "El-Sayeda Zeinab",
  "Saad Zaghloul",
  "El-Sadat",
  "Orabi",
  "El-Shohadaa",
  "Ghamra",
  "El-Demerdash",
  "Manshyet El-Sadr",
  "Kobry El-Qubba",
  "Hammamet El-Qubba",
  "Saray El-Qubba",
  "Hadayek El-Zaytoun",
  "Helmayet El-Zaytoun",
  "El-Mattareya",
  "Ain Shams",
  "Ezbet El-Nakhl",
  "Al-Marg",
  "New El-Marg",
  "Shubra El-Kheima",
  "Koleyet El-Zeraa",
  "El-Mezallat",
  "El-Khalafawy",
  "Saint Theresa",
  "Rod El-Farag",
  "Massara",
  "Nageeb",
  "Opera",
  "Dokki",
  "El-Behoos",
  "Cairo University",
  "Faysal",
  "Giza",
  "Omm El-Masryeen",
  "Sakyet-Mekky",
  "El-Moneeb",
  "Adly Mansour",
  "El-Haikstep",
  "Omar Ibn El-Khattab",
  "Qebaa",
  "Hesham Barakat",
  "Nozha",
  "El-Shams Club",
  "Alf Masken",
  "Heliopolis",
  "Haroun",
  "El-Ahram",
  "Kolleyet El-Banat",
  "Stadium",
  "Fair Zone",
  "El-Abassiya",
  "Abdou Pasha",
  "El-Geish",
  "Bab El-Shaariya",
  "Attaba",
  "Nasser",
  "Maspero",
  "Safaa Hegazy",
  "Kit-Kat",
  "Sudan",
  "Imbaba",
  "El-Bohy",
  "El-Qawmia",
  "Ring Road",
  "Rod El Farag Corr",
  "Tawfikia",
  "Wadi El-Nile",
  "Gamet El-Dowel",
  "Boulak El-Dakrour",
];
final List<LineModel> allLine = [
  line1,
  line2,
  line3Main,
  line3Branch1,
  line3Branch2,
];

class Metro {
  TripDetailsModel details = TripDetailsModel();



  // الدالة الرئيسية لإيجاد تفاصيل الرحلة
  TripDetailsModel getTripDetails(String start, String end) {
    details.clear(); // تنظيف التفاصيل السابقة

    // إيجاد أقصر مسار بأقل عدد من التحويلات باستخدام BFS
    List<StationModel> path = _findShortestPath(start, end);

    if (path.isEmpty) {
      throw TripDetailsException(message: S.current.checkDetails);
    }

    // تقسيم المسار إلى routes و directions
    _processPath(path);

    // تحديث التفاصيل
    details.startStation = start;
    details.finalStation = end;
    details.directions.remove(details.directions.first);
    details.calcStationCount(path.length);
    details.calcTicketPrice(path.length);
    details.calcTransfer();
    details.calcTime();

    return details;
  }

  // بناء الرسم البياني
  Map<String, List<MapEntry<StationModel, LineModel>>> _buildGraph() {
    Map<String, List<MapEntry<StationModel, LineModel>>> graph = {};

    // إضافة الروابط بين المحطات المتتالية في كل خط
    for (var line in allLine) {
      for (int i = 0; i < line.stations.length; i++) {
        var current = line.stations[i];
        if (!graph.containsKey(current.name)) {
          graph[current.name!] = [];
        }
        // إضافة المحطة السابقة (إذا وجدت)
        if (i > 0) {
          var prev = line.stations[i - 1];
          graph[current.name!]!.add(MapEntry(prev, line));
        }
        // إضافة المحطة التالية (إذا وجدت)
        if (i < line.stations.length - 1) {
          var next = line.stations[i + 1];
          graph[current.name!]!.add(MapEntry(next, line));
        }
      }
    }
    return graph;
  }

  // إيجاد أقصر مسار بأقل عدد من التحويلات باستخدام BFS
  List<StationModel> _findShortestPath(String start, String end) {
    var graph = _buildGraph();
    var visited = <String, int>{}; // تخزين أقل عدد محطات لكل محطة
    var parent = <String, StationModel>{};
    var lineUsed = <String, LineModel>{};
    var transfers = <String, int>{}; // تخزين عدد التحويلات لكل محطة
    var queue = Queue<List<dynamic>>(); // [station, line, transfers, distance]
    var startStation = _getStationSafe(start);
    var bestPaths = <List<StationModel>>[]; // تخزين أفضل المسارات
    var minDistance = double.infinity; // أقل عدد محطات

    queue.add([startStation, null, 0, 0]); // [محطة, خط, عدد التحويلات, المسافة]
    visited[start] = 0;
    transfers[start] = 0;

    while (queue.isNotEmpty) {
      var current = queue.removeFirst();
      var currentStation = current[0] as StationModel;
      var currentLine = current[1] as LineModel?;
      var currentTransfers = current[2] as int;
      var currentDistance = current[3] as int;

      // إذا وصلنا إلى المحطة النهائية
      if (currentStation.name == end) {
        if (currentDistance <= minDistance) {
          if (currentDistance < minDistance) {
            bestPaths.clear();
            minDistance = currentDistance.toDouble();
          }
          // إعادة بناء المسار
          List<StationModel> path = [];
          var curr = currentStation;
          while (curr.name != start) {
            path.add(curr);
            curr = parent[curr.name]!;
          }
          path.add(startStation);
          bestPaths.add(path.reversed.toList());
        }
        continue;
      }

      // جلب الجيران
      var neighbors = graph[currentStation.name] ?? [];
      for (var neighborEntry in neighbors) {
        var neighbor = neighborEntry.key;
        var line = neighborEntry.value;
        var newTransfers = currentTransfers;

        // التحقق من التحويل عند Kit-Kat
        if (currentLine != null &&
            line != currentLine &&
            currentStation.name != start) {
          if (currentStation.name == "Kit-Kat") {
            // زيادة عدد التحويلات فقط إذا كان الانتقال بين line3Branch1 و line3Branch2
            bool isBranch1ToBranch2 =
                (currentLine == line3Branch1 && line == line3Branch2) ||
                (currentLine == line3Branch2 && line == line3Branch1);
            if (isBranch1ToBranch2) {
              newTransfers = currentTransfers + 1;
            }
          } else {
            // زيادة عدد التحويلات لأي تغيير خط آخر
            newTransfers = currentTransfers + 1;
          }
        }

        var newDistance = currentDistance + 1;
        if (!visited.containsKey(neighbor.name) ||
            newDistance <= visited[neighbor.name]!) {
          if (!visited.containsKey(neighbor.name) ||
              newDistance < visited[neighbor.name]!) {
            visited[neighbor.name!] = newDistance;
            transfers[neighbor.name!] = newTransfers;
            parent[neighbor.name!] = currentStation;
            lineUsed[neighbor.name!] = line;
            queue.add([neighbor, line, newTransfers, newDistance]);
          } else if (newDistance == visited[neighbor.name]! &&
              newTransfers < transfers[neighbor.name]!) {
            // إذا كان عدد المحطات متساويًا ولكن عدد التحويلات أقل
            transfers[neighbor.name!] = newTransfers;
            parent[neighbor.name!] = currentStation;
            lineUsed[neighbor.name!] = line;
            queue.add([neighbor, line, newTransfers, newDistance]);
          }
        }
      }
    }

    // اختيار المسار بأقل عدد من التحويلات من بين المسارات ذات الحد الأدنى من المحطات
    if (bestPaths.isEmpty) return [];

    var minTransfers = double.infinity;
    List<StationModel> bestPath = [];
    for (var path in bestPaths) {
      int pathTransfers = 0;
      LineModel? prevLine;
      for (int i = 1; i < path.length; i++) {
        var currLine = _getLineForStations(path[i - 1].name!, path[i].name!);
        if (currLine != null && prevLine != null && currLine != prevLine) {
          if (path[i - 1].name == "Kit-Kat") {
            bool isBranch1ToBranch2 =
                (prevLine == line3Branch1 && currLine == line3Branch2) ||
                (prevLine == line3Branch2 && currLine == line3Branch1);
            if (isBranch1ToBranch2) {
              pathTransfers++;
            }
          } else {
            pathTransfers++;
          }
        }
        prevLine = currLine;
      }
      if (pathTransfers < minTransfers) {
        minTransfers = pathTransfers.toDouble();
        bestPath = path;
      }
    }

    return bestPath.isEmpty ? bestPaths[0] : bestPath;
  }

  // تقسيم المسار إلى routes و directions مع استثناء Kit-Kat والتعامل مع المحطة الأخيرة
  void _processPath(List<StationModel> path) {
    if (path.isEmpty) return;

    List<StationModel> currentRoute = [path[0]];
    LineModel? currentLine = path.length > 1
        ? _getLineForStations(path[0].name!, path[1].name!)
        : null;
    details.directions.add(path[0]); // إضافة محطة البداية

    for (int i = 1; i < path.length; i++) {
      var currStation = path[i];
      var prevStation = path[i - 1];
      var nextLine = _getLineForStations(prevStation.name!, currStation.name!);

      // التحقق من ما إذا كان يجب التقسيم أم لا
      bool shouldSplit =
          nextLine != currentLine &&
          (prevStation.name != "Kit-Kat" ||
              _isBranch1ToBranch2(currentLine, nextLine));

      // التحقق من المحطة الأخيرة
      if (i == path.length - 1) {
        // جلب الخطوط التي تحتوي على المحطة الأخيرة
        var lastStationLines = allLine
            .where(
              (line) => line.stations.any((s) => s.name == currStation.name),
            )
            .toList();
        bool isLastStationOnCurrentLine =
            currentLine != null &&
            lastStationLines.any((line) => line == currentLine);

        // إذا كانت المحطة الأخيرة على خط مختلف
        if (!isLastStationOnCurrentLine && lastStationLines.isNotEmpty) {
          // إغلاق الـ route الحالي حتى المحطة قبل الأخيرة
          if (currentRoute.length > 1 ||
              (currentRoute.length == 1 && details.routes.isEmpty)) {
            details.routes.add(List.from(currentRoute));
            if (currentLine != null) {
              details.directions.add(
                _getDirection(
                  currentLine,
                  currentRoute.first.name!,
                  currentRoute.last.name!,
                ),
              );
            }
          }
          // إنشاء route جديد للمحطة الأخيرة
          currentRoute = [currStation];
          currentLine = lastStationLines.firstWhere(
            (line) => line.stations.any((s) => s.name == currStation.name),
          );
          details.routes.add(List.from(currentRoute));
          details.directions.add(
            _getDirection(currentLine, currStation.name!, currStation.name!),
          );
          continue;
        }
      }

      if (shouldSplit) {
        if (i == path.length - 1) {
          currentRoute.add(currStation);
        }
        details.routes.add(List.from(currentRoute));
        if (currentLine != null) {
          details.directions.add(
            _getDirection(
              currentLine,
              currentRoute.first.name!,
              currentRoute.last.name!,
            ),
          );
        }
        currentRoute = [currStation];
        currentLine = nextLine;
      } else {
        // إذا لم يكن تقسيم (مثل main-branch عبر Kit-Kat)، استمر في الـ route وحدث currentLine
        currentRoute.add(currStation);
        currentLine = nextLine; // تحديث الخط للجزء التالي
      }
    }

    // إضافة المسار الأخير إذا لم يتم إضافته
    if (currentRoute.length > 1 ||
        (currentRoute.length == 1 && details.routes.isEmpty)) {
      details.routes.add(currentRoute);
      if (currentLine != null) {
        details.directions.add(
          _getDirection(
            currentLine,
            currentRoute.first.name!,
            currentRoute.last.name!,
          ),
        );
      }
    }
  }

  // دالة مساعدة للتحقق من ما إذا كان التغيير بين branch1 و branch2
  bool _isBranch1ToBranch2(LineModel? line1, LineModel? line2) {
    if (line1 == null || line2 == null) return false;
    return (line1 == line3Branch1 && line2 == line3Branch2) ||
        (line1 == line3Branch2 && line2 == line3Branch1);
  }

  // جلب الخط الذي يحتوي على محطتين متتاليتين
  LineModel? _getLineForStations(String firstStation, String secondStation) {
    for (var line in allLine) {
      var stations = line.stations.map((e) => e.name).toList();
      int firstIndex = stations.indexOf(firstStation);
      int secondIndex = stations.indexOf(secondStation);
      if (firstIndex != -1 &&
          secondIndex != -1 &&
          (firstIndex - secondIndex).abs() == 1) {
        return line;
      }
    }
    // التعامل مع التفرعات (مثل Line 3)
    if (line3Main.stations.any((e) => e.name == firstStation) &&
            line3Branch1.stations.any((e) => e.name == secondStation) ||
        line3Branch1.stations.any((e) => e.name == firstStation) &&
            line3Main.stations.any((e) => e.name == secondStation)) {
      return LineModel(
        lineColor: AppColor.line3Color,
        lineName: 'Line3 & Branch1',
        stations: [
          ...line3Main.stations,
          ...line3Branch1.stations.where((e) => e.name != kitKat.name),
        ],
      );
    } else if (line3Main.stations.any((e) => e.name == firstStation) &&
            line3Branch2.stations.any((e) => e.name == secondStation) ||
        line3Branch2.stations.any((e) => e.name == firstStation) &&
            line3Main.stations.any((e) => e.name == secondStation)) {
      return LineModel(
        lineColor: AppColor.line3Color,
        lineName: 'Line3 & Branch2',
        stations: [
          ...line3Main.stations,
          ...line3Branch2.stations.where((e) => e.name != kitKat.name),
        ],
      );
    }
    return null;
  }

  // إرجاع محطة الوجهة (الاتجاه) بناءً على الخط
  StationModel _getDirection(LineModel line, String start, String end) {
    int indexS = line.stations.indexWhere((e) => e.name == start);
    int indexF = line.stations.indexWhere((e) => e.name == end);
    if ((indexF - indexS) > 0) {
      return line.stations[line.stations.length - 1];
    } else {
      return line.stations[0];
    }
  }

  // جلب المحطة بأمان
  StationModel _getStationSafe(String name) {
    for (var line in allLine) {
      if (line.stations.any((e) => e.name == name)) {
        return line.stations.firstWhere((e) => e.name == name);
      }
    }
    throw TripDetailsException(message: "Station $name not found");
  }
}
