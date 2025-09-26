import 'package:metro_egypt_guide/core/Helper/metro_helper/models/line_model.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/station_model.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';

List<LineModel> allLines = [
  line1,
  line2,
  line3Main,
  line3Branch1,
  line3Branch2,
];

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
  "El-Haykestep", //!
  "Omar Ibn El-Khattab", //!
  "Qobaa", //!
  "Hesham Barakat", //!
  "El-Nozha", //!
  "El-Shams Club",
  "Alf Maskan", //!
  "Heliopolis", //!
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

class Metro {
  Metro._internal();
  static final Metro _instance = Metro._internal();
  factory Metro() => _instance;

  TripDetailsModel details = TripDetailsModel();
  bool clearIt = true;
  TripDetailsModel getTripDetails(String start, String end) {
    final visited = <StationModel>{};
    final path = <StationModel>[];
    if (clearIt) {
      details.clear();
    }

    final result = _findShortestPath(start, end, visited, path);

    details.setTicketPrice(result.length);
    details.setStationCount(result.length);
    if (result.isNotEmpty) {
      final line = _cheackSameLine(
        result[0].name!,
        result[result.length - 1].name!,
      );
      if (line != null) {
        _sameLineDetails(result, line);
      } else {
        _transportBetweenLinesDetails(result, start, end);
      }
    }
    details.startStation = start;
    details.finalStation = end;

    List<String> route = [];
    List<String> directions = [];
    for (var element in details.routes) {
      for (var ee in element) {
        route.add(ee.name!);
      }
    }
    for (var element in details.directions) {
      directions.add(element.name!);
    }
    clearIt = true;
    return details;
  }

  //<===========================internal func===========================================>
  void _transportBetweenLinesDetails(
    List<StationModel> result,
    String start,
    String end,
  ) {
    int last = 0;
    LineModel prevLine = _cheackSameLine(result[0].name!, result[1].name!)!;
    LineModel? currLine;
    for (var i = 1; i < result.length - 2; i++) {
      currLine = _cheackSameLine(result[i].name!, result[i + 1].name!);
      if (prevLine != currLine &&
          commonStations.any((e) => e.name == result[i].name!) &&
          prevLine.stations.any((e) => e.name == result[i].name) &&
          currLine!.stations.any((e) => e.name == result[i].name)) {
        final route = result.sublist(last, i + 1);
        details.routes.add(route);
        final direction = _getDirection(
          _cheackSameLine(result[last].name!, result[i].name!)!,
          result[last].name!,
          result[i].name!,
        );

        details.directions.add(direction);
        last = i + 1;
      }
    }
    final finalRoute = result.sublist(last);
    clearIt = false;
    getTripDetails(
      finalRoute[0].name!,
      finalRoute[finalRoute.length - 1].name!,
    );
  }

  void _sameLineDetails(List<StationModel> result, LineModel line) {
    details.routes.add(result);
    details.directions.add(
      _getDirection(line, result[0].name!, result[result.length - 1].name!),
    );
  }

  StationModel _getDirection(LineModel line, String start, String end) {
    int indexS = line.stations.indexWhere((e) => e.name == start);
    int indexF = line.stations.indexWhere((e) => e.name == end);

    if ((indexF - indexS) > 0) {
      return line.stations[line.stations.length - 1];
    } else {
      return line.stations[0];
    }
  }

  StationModel? _getStation(String name) {
    for (var line in allLines) {
      if (line.stations.any((e) => e.name == name)) {
        return line.stations.firstWhere((e) => e.name == name);
      }
    }
    return null;
  }

  LineModel? _cheackSameLine(String firstStation, String secondStation) {
    if ((line3Main.stations.any((e) => e.name == firstStation) &&
            line3Branch1.stations.any((e) => e.name == secondStation)) ||
        (line3Branch1.stations.any((e) => e.name == firstStation) &&
            line3Main.stations.any((e) => e.name == secondStation))) {
      return LineModel(
        lineColor: AppColor.line3Color,
        lineName: 'Line3 & Branch1',
        stations: [
          ...line3Main.stations,
          ...line3Branch1.stations.where((e) => e.name != kitKat.name),
        ],
      );
    } else if ((line3Main.stations.any((e) => e.name == firstStation) &&
            line3Branch2.stations.any((e) => e.name == secondStation)) ||
        (line3Branch2.stations.any((e) => e.name == firstStation) &&
            line3Main.stations.any((e) => e.name == secondStation))) {
      return LineModel(
        lineColor: AppColor.line3Color,
        lineName: 'Line3 & Branch2',
        stations: [
          ...line3Main.stations,
          ...line3Branch2.stations.where((e) => e.name != kitKat.name),
        ],
      );
    } else if (line3Main.stations.any((e) => e.name == firstStation) &&
        line3Main.stations.any((e) => e.name == secondStation)) {
      return line3Main;
    } else if (line3Branch1.stations.any((e) => e.name == firstStation) &&
        line3Branch1.stations.any((e) => e.name == secondStation)) {
      return line3Branch1;
    } else if (line3Branch2.stations.any((e) => e.name == firstStation) &&
        line3Branch2.stations.any((e) => e.name == secondStation)) {
      return line3Branch2;
    } else if (line2.stations.any((e) => e.name == firstStation) &&
        line2.stations.any((e) => e.name == secondStation)) {
      return line2;
    } else if (line1.stations.any((e) => e.name == firstStation) &&
        line1.stations.any((e) => e.name == secondStation)) {
      return line1;
    }

    return null;
  }

  List<StationModel> _findShortestPath(
    String start,
    String end,
    Set<StationModel> visited,
    List<StationModel> path,
  ) {
    if (visited.any((e) => e.name == start)) return [];

    visited.add(_getStation(start)!);
    path.add(_getStation(start)!);

    if (start == end) return List.from(path);

    List<StationModel> shortest = [];

    for (var line in allLines) {
      if (!line.stations.any((e) => e.name == start)) continue;

      final index = line.stations.indexWhere((e) => e.name == start);
      final neighbors = _getNeighbors(start);

      for (var neighbor in neighbors) {
        if (visited.any((e) => e.name == neighbor.name)) continue;

        final newPath = _findShortestPath(
          neighbor.name!,
          end,
          Set.from(visited),
          List.from(path),
        );
        if (newPath.isNotEmpty &&
            (shortest.isEmpty || newPath.length < shortest.length)) {
          shortest = newPath;
        }
      }
    }

    return shortest;
  }

  List<StationModel> _getNeighbors(String station) {
    final neighbors = <StationModel>[];

    for (var line in allLines) {
      final index = line.stations.indexWhere((e) => e.name == station);
      if (index == -1) continue;

      if (index > 0) neighbors.add(line.stations[index - 1]);
      if (index < line.stations.length - 1) {
        neighbors.add(line.stations[index + 1]);
      }

      for (var s in line.stations) {
        if (s.name == station && s.name != station) {
          neighbors.add(s);
        }
      }
    }

    return neighbors.toSet().toList();
  }
}
