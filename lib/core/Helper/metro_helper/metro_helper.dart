import 'package:metro_egypt_guide/core/Helper/metro_helper/models/station_model.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/trip_details_model.dart';

final line1 = [
  "Helwan",
  "Ain Helwan",
  "Helwan University",
  "Wadi Hof",
  "Hadayek Helwan",
  "El-Maasara",
  "Tora El-Asmant",
  "Kozzika",
  "Tora El-Balad",
  "Sakanat El Maadi",
  "El Maadi",
  "Hadayek El Maadi",
  "Dar El Salam",
  "El Zahraa",
  "Mar Girgis",
  "El Malek El Saleh",
  "El Sayeda Zeinab",
  "Saad Zaghloul",
  "Sadat",
  "Nasser",
  "Orabi",
  "El Shohadaa",
  "Ghamra",
  "El Demerdash",
  "Manshiet El Sadr",
  "Kobri El Qobba",
  "Hammamat El Qobba",
  "Saray El Qobba",
  "Hadayek El Zaitoun",
  "Helmeyet El Zeitoun",
  "El Matariya",
  "Ain Shams",
  "Ezbet El Nakhl",
  "Al Marg",
  "New El-Marg",
];

final line2 = [
  "Shubra El Kheima",
  "Koliet El Zeraa",
  "Mezallat",
  "Khalafawy",
  "St. Teresa",
  "Rod El Farag",
  "Masarra",
  "El Shohadaa",
  "Attaba",
  "Naguib",
  "Sadat",
  "Opera",
  "Dokki",
  "El Bohoth",
  "Cairo University",
  "Faisal",
  "Giza",
  "Omm El Misryeen",
  "Sakiat Mekky",
  "El-Mounib",
];

final line3Main = [
  "Adly Mansour",
  "El Haykestep",
  "Omar Ibn El Khattab",
  "Qobaa",
  "Hesham Barakat",
  "El Nozha",
  "Nadi El Shams",
  "Alf Maskan",
  "Heliopolis",
  "Haroun",
  "Al Ahram",
  "Kolleyet El Banat",
  "Stadium",
  "Fair Zone",
  "Abbassiya",
  "Abdou Pasha",
  "El Geish",
  "Bab El Shaaria",
  "Attaba",
  "Nasser",
  "Maspero",
  "Safaa Hegazy",
  "Kit Kat",
];

final line3Branch1 = [
  "Kit Kat",
  "Sudan",
  "Imbaba",
  "El-Bohy",
  "El-Qawmia",
  "Ring Road",
  "Rod al-Farag Corridor",
];

final line3Branch2 = [
  "Kit Kat",
  "Tawfikia",
  "Wadi El Nile",
  "Gamat El Dowal",
  "Boulak El Dakrour",
  "Cairo University",
];

final allLines = [line1, line2, line3Main, line3Branch1, line3Branch2];

final commonStations = [
  'Nasser',
  'Attaba',
  'El Shohadaa',
  'Sadat',
  'Cairo University',
  'Kit Kat',
];

class Metro {
  TripDetailsModel details = TripDetailsModel();

  TripDetailsModel getTripDetails(String start, String end) {
    final visited = <String>{};
    final path = <String>[];

    final result = _findShortestPath(start, end, visited, path);
    print(result);
    details.setTicketPrice(result.length);
    details.setStationCount(result.length);
    if (result.isNotEmpty) {
      final line = _cheackSameLine(result[0], result[result.length - 1]);
      if (line != null) {
        _sameLineDetails(result, line);
      } else {
        _transportBetweenLinesDetails(result, start, end);
      }
    }

    return details;
  }

  void _transportBetweenLinesDetails(
    List<String> result,
    String start,
    String end,
  ) {
    int last = 0;
    for (var i = 0; i < result.length - 2; i++) {
      if (commonStations.contains(result[i + 1]) &&
          _cheackSameLine(result[i], result[i + 2]) == null) {
        final route = result.sublist(last, i + 2);
        details.routes.add(route);
        final direction = _getDirection(
          _cheackSameLine(result[i], result[i + 1])!,
          start,
          end,
        );

        details.directions.add(direction);
        last = i + 2;
      }
    }
    final finalRoute = result.sublist(last);
    details.routes.add(finalRoute);
    final finalDirection = _getDirection(
      _cheackSameLine(finalRoute[0], finalRoute[finalRoute.length - 1])!,
      finalRoute[0],
      finalRoute[finalRoute.length - 1],
    );
    details.directions.add(finalDirection);
  }

  void _sameLineDetails(List<String> result, List<String> line) {
    details.routes.add(result);
    details.directions.add(
      _getDirection(line, result[0], result[result.length - 1]),
    );
  }

  String _getDirection(List<String> line, String start, String end) {
    int indexS = line.indexOf(start);
    int indexF = line.indexOf(end);

    if ((indexF - indexS) > 0) {
      return line[line.length - 1];
    } else {
      return line[0];
    }
  }

  List<String>? _cheackSameLine(String firstStation, String secondStation) {
    if ((line3Main.contains(firstStation) &&
            line3Branch1.contains(secondStation)) ||
        (line3Branch1.contains(firstStation) &&
            line3Main.contains(secondStation))) {
      return [...line3Main, ...line3Branch1];
    } else if ((line3Main.contains(firstStation) &&
            line3Branch2.contains(secondStation)) ||
        (line3Branch2.contains(firstStation) &&
            line3Main.contains(secondStation))) {
      return [...line3Main, ...line3Branch2];
    } else if (line3Main.contains(firstStation) &&
        line3Main.contains(secondStation)) {
      return [...line3Main, ...line3Branch1];
    } else if (line3Branch1.contains(firstStation) &&
        line3Branch1.contains(secondStation)) {
      return line3Branch1;
    } else if (line3Branch2.contains(firstStation) &&
        line3Branch2.contains(secondStation)) {
      return line3Branch2;
    } else if (line2.contains(firstStation) && line2.contains(secondStation)) {
      return line2;
    } else if (line1.contains(firstStation) && line1.contains(secondStation)) {
      return line1;
    }

    return null;
  }

  List<String> _findShortestPath(
    String current,
    String destination,
    Set<String> visited,
    List<String> path,
  ) {
    if (visited.contains(current)) return [];

    visited.add(current);
    path.add(current);

    if (current == destination) return List.from(path);

    List<String> shortest = [];

    for (var line in allLines) {
      if (!line.contains(current)) continue;

      final index = line.indexOf(current);
      final neighbors = <String>[];

      if (index > 0) neighbors.add(line[index - 1]);
      if (index < line.length - 1) neighbors.add(line[index + 1]);

      for (var neighbor in neighbors) {
        if (visited.contains(neighbor)) continue;

        final newPath = _findShortestPath(
          neighbor,
          destination,
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
}

List<StationModel> allLinesDetails = [
  StationModel(name: "Helwan", latitude: 29.8490, longitudee: 31.3342),
  StationModel(name: "Ain Helwan", latitude: 29.8628, longitudee: 31.3250),
  StationModel(
    name: "Helwan University",
    latitude: 29.8689,
    longitudee: 31.3203,
  ),
  StationModel(name: "Wadi Hof", latitude: 29.8794, longitudee: 31.3133),
  StationModel(name: "Hadayek Helwan", latitude: 29.8972, longitudee: 31.3042),
  StationModel(name: "El-Maasara", latitude: 29.9061, longitudee: 31.2997),
  StationModel(name: "Tora El-Asmant", latitude: 29.9258, longitudee: 31.2878),
  StationModel(name: "Kozzika", latitude: 29.9361, longitudee: 31.2817),
  StationModel(name: "Tora El-Balad", latitude: 29.9464, longitudee: 31.2736),
  StationModel(
    name: "Sakanat El-Maadi",
    latitude: 29.9528,
    longitudee: 31.2633,
  ),
  StationModel(name: "Maadi", latitude: 29.9597, longitudee: 31.2581),
  StationModel(
    name: "Hadayek El-Maadi",
    latitude: 29.9700,
    longitudee: 31.2506,
  ),
  StationModel(name: "Dar El-Salam", latitude: 29.9819, longitudee: 31.2422),
  StationModel(name: "El-Zahraa'", latitude: 29.9953, longitudee: 31.2317),
  StationModel(name: "Mar Girgis", latitude: 30.0058, longitudee: 31.2294),
  StationModel(
    name: "El-Malek El-Saleh",
    latitude: 30.0169,
    longitudee: 31.2310,
  ),
  StationModel(
    name: "Al-Sayeda Zeinab",
    latitude: 30.0292,
    longitudee: 31.2353,
  ),
  StationModel(name: "Saad Zaghloul", latitude: 30.0367, longitudee: 31.2381),
  StationModel(name: "Sadat", latitude: 30.0444, longitudee: 31.2356),
  StationModel(name: "Nasser", latitude: 30.0536, longitudee: 31.2389),
  StationModel(name: "Orabi", latitude: 30.0575, longitudee: 31.2425),
  StationModel(name: "Al-Shohadaa", latitude: 30.0620, longitudee: 31.2461),
  StationModel(name: "Ghamra", latitude: 30.0689, longitudee: 31.2647),
  StationModel(name: "El-Demerdash", latitude: 30.0772, longitudee: 31.2778),
  StationModel(
    name: "Manshiet El-Sadr",
    latitude: 30.0822,
    longitudee: 31.2878,
  ),
  StationModel(name: "Kobri El-Qobba", latitude: 30.0870, longitudee: 31.2939),
  StationModel(
    name: "Hammamat El-Qobba",
    latitude: 30.0903,
    longitudee: 31.2981,
  ),
  StationModel(name: "Saray El-Qobba", latitude: 30.0981, longitudee: 31.3047),
  StationModel(
    name: "Hadayeq El-Zaitoun",
    latitude: 30.1053,
    longitudee: 31.3100,
  ),
  StationModel(
    name: "Helmeyet El-Zaitoun",
    latitude: 30.1144,
    longitudee: 31.3139,
  ),
  StationModel(name: "El-Matareyya", latitude: 30.1214, longitudee: 31.3139),
  StationModel(name: "Ain Shams", latitude: 30.1311, longitudee: 31.3181),
  StationModel(name: "Ezbet El-Nakhl", latitude: 30.1392, longitudee: 31.3244),
  StationModel(name: "El-Marg", latitude: 30.1522, longitudee: 31.3356),
  StationModel(name: "New El-Marg", latitude: 30.1633, longitudee: 31.3383),
  StationModel(
    name: "Shubra El Kheima",
    latitude: 30.1225,
    longitudee: 31.2447,
  ),
  StationModel(
    name: "Koleyet El Zeraa",
    latitude: 30.1139,
    longitudee: 31.2486,
  ),
  StationModel(name: "Mezallat", latitude: 30.1050, longitudee: 31.2467),
  StationModel(name: "Khalafawy", latitude: 30.0981, longitudee: 31.2453),
  StationModel(name: "St. Teresa", latitude: 30.0883, longitudee: 31.2456),
  StationModel(name: "Rod El Farag", latitude: 30.0806, longitudee: 31.2456),
  StationModel(name: "Masarra", latitude: 30.0711, longitudee: 31.2450),
  StationModel(name: "El Shohadaa", latitude: 30.0619, longitudee: 31.2461),
  StationModel(name: "Attaba", latitude: 30.0525, longitudee: 31.2469),
  StationModel(name: "Naguib", latitude: 30.0453, longitudee: 31.2442),
  StationModel(name: "Sadat", latitude: 30.0444, longitudee: 31.2356),
  StationModel(name: "Opera", latitude: 30.0420, longitudee: 31.2253),
  StationModel(name: "Dokki", latitude: 30.0383, longitudee: 31.2119),
  StationModel(name: "El Bohoth", latitude: 30.0358, longitudee: 31.2003),
  StationModel(
    name: "Cairo University",
    latitude: 30.0272,
    longitudee: 31.2011,
  ),
  StationModel(name: "Faisal", latitude: 30.0172, longitudee: 31.2039),
  StationModel(name: "Giza", latitude: 30.0106, longitudee: 31.2070),
  StationModel(name: "Omm El Misryeen", latitude: 30.0053, longitudee: 31.2081),
  StationModel(name: "Sakiat Mekky", latitude: 29.9956, longitudee: 31.2086),
  StationModel(name: "El-Mounib", latitude: 29.9814, longitudee: 31.2120),
  StationModel(name: "Adly Mansour", latitude: 30.1469, longitudee: 31.4214),
  StationModel(name: "El Haykestep", latitude: 30.1439, longitudee: 31.4047),
  StationModel(
    name: "Omar Ibn El-Khattab",
    latitude: 30.1406,
    longitudee: 31.3930,
  ),
  StationModel(name: "Qobaa", latitude: 30.1347, longitudee: 31.3839),
  StationModel(name: "Hesham Barakat", latitude: 30.1311, longitudee: 31.3728),
  StationModel(name: "El Nozha", latitude: 30.1283, longitudee: 31.3600),
  StationModel(name: "Nadi El-Shams", latitude: 30.1222, longitudee: 31.3439),
  StationModel(name: "Alf Maskan", latitude: 30.1170, longitudee: 31.3397),
  StationModel(
    name: "Heliopolis Square",
    latitude: 30.1081,
    longitudee: 31.3381,
  ),
  StationModel(name: "Haroun", latitude: 30.1000, longitudee: 31.3328),
  StationModel(name: "Al-Ahram", latitude: 30.0914, longitudee: 31.3264),
  StationModel(
    name: "Koleyet El-Banat",
    latitude: 30.0836,
    longitudee: 31.3290,
  ),
  StationModel(name: "Stadium", latitude: 30.0731, longitudee: 31.3175),
  StationModel(name: "Fair Zone", latitude: 30.0733, longitudee: 31.3011),
  StationModel(name: "Abbassia", latitude: 30.0697, longitudee: 31.2808),
  StationModel(name: "Abdou Pasha", latitude: 30.0647, longitudee: 31.2747),
  StationModel(name: "El Geish", latitude: 30.0628, longitudee: 31.2669),
  StationModel(name: "Bab El Shaaria", latitude: 30.0539, longitudee: 31.2561),
  StationModel(name: "Attaba", latitude: 30.0525, longitudee: 31.2469),
  StationModel(name: "Nasser", latitude: 30.0536, longitudee: 31.2389),
  StationModel(name: "Maspero", latitude: 30.0556, longitudee: 31.2322),
  StationModel(name: "Safaa Hegazy", latitude: 30.0625, longitudee: 31.2225),
  StationModel(name: "Kit Kat", latitude: 30.0667, longitudee: 31.2131),
  StationModel(name: "Sudan", latitude: 30.0697, longitudee: 31.2053),
  StationModel(name: "Imbaba", latitude: 30.0750, longitudee: 31.2075),
  StationModel(name: "El-Bohy", latitude: 30.0822, longitudee: 31.2106),
  StationModel(name: "El-Qawmia", latitude: 30.0933, longitudee: 31.2089),
  StationModel(name: "Ring Road", latitude: 30.0964, longitudee: 31.1997),
  StationModel(
    name: "Rod al-Farag Corridor",
    latitude: 30.1019,
    longitudee: 31.1831,
  ),
  StationModel(name: "Tawfikia", latitude: 30.0653, longitudee: 31.2025),
  StationModel(name: "Wadi El Nile", latitude: 30.0583, longitudee: 31.2000),
  StationModel(name: "Gamat El Dowal", latitude: 30.0508, longitudee: 31.1997),
  StationModel(
    name: "Boulak El Dakrour",
    latitude: 30.0361,
    longitudee: 31.1964,
  ),
  StationModel(
    name: "Cairo University",
    latitude: 30.0261,
    longitudee: 31.2011,
  ),
];

List<StationModel> line1Details = [
  StationModel(name: "Helwan", latitude: 29.8490, longitudee: 31.3342),
  StationModel(name: "Ain Helwan", latitude: 29.8628, longitudee: 31.3250),
  StationModel(
    name: "Helwan University",
    latitude: 29.8689,
    longitudee: 31.3203,
  ),
  StationModel(name: "Wadi Hof", latitude: 29.8794, longitudee: 31.3133),
  StationModel(name: "Hadayek Helwan", latitude: 29.8972, longitudee: 31.3042),
  StationModel(name: "El-Maasara", latitude: 29.9061, longitudee: 31.2997),
  StationModel(name: "Tora El-Asmant", latitude: 29.9258, longitudee: 31.2878),
  StationModel(name: "Kozzika", latitude: 29.9361, longitudee: 31.2817),
  StationModel(name: "Tora El-Balad", latitude: 29.9464, longitudee: 31.2736),
  StationModel(
    name: "Sakanat El-Maadi",
    latitude: 29.9528,
    longitudee: 31.2633,
  ),
  StationModel(name: "Maadi", latitude: 29.9597, longitudee: 31.2581),
  StationModel(
    name: "Hadayek El-Maadi",
    latitude: 29.9700,
    longitudee: 31.2506,
  ),
  StationModel(name: "Dar El-Salam", latitude: 29.9819, longitudee: 31.2422),
  StationModel(name: "El-Zahraa'", latitude: 29.9953, longitudee: 31.2317),
  StationModel(name: "Mar Girgis", latitude: 30.0058, longitudee: 31.2294),
  StationModel(
    name: "El-Malek El-Saleh",
    latitude: 30.0169,
    longitudee: 31.2310,
  ),
  StationModel(
    name: "Al-Sayeda Zeinab",
    latitude: 30.0292,
    longitudee: 31.2353,
  ),
  StationModel(name: "Saad Zaghloul", latitude: 30.0367, longitudee: 31.2381),
  StationModel(name: "Sadat", latitude: 30.0444, longitudee: 31.2356),
  StationModel(name: "Nasser", latitude: 30.0536, longitudee: 31.2389),
  StationModel(name: "Orabi", latitude: 30.0575, longitudee: 31.2425),
  StationModel(name: "Al-Shohadaa", latitude: 30.0620, longitudee: 31.2461),
  StationModel(name: "Ghamra", latitude: 30.0689, longitudee: 31.2647),
  StationModel(name: "El-Demerdash", latitude: 30.0772, longitudee: 31.2778),
  StationModel(
    name: "Manshiet El-Sadr",
    latitude: 30.0822,
    longitudee: 31.2878,
  ),
  StationModel(name: "Kobri El-Qobba", latitude: 30.0870, longitudee: 31.2939),
  StationModel(
    name: "Hammamat El-Qobba",
    latitude: 30.0903,
    longitudee: 31.2981,
  ),
  StationModel(name: "Saray El-Qobba", latitude: 30.0981, longitudee: 31.3047),
  StationModel(
    name: "Hadayeq El-Zaitoun",
    latitude: 30.1053,
    longitudee: 31.3100,
  ),
  StationModel(
    name: "Helmeyet El-Zaitoun",
    latitude: 30.1144,
    longitudee: 31.3139,
  ),
  StationModel(name: "El-Matareyya", latitude: 30.1214, longitudee: 31.3139),
  StationModel(name: "Ain Shams", latitude: 30.1311, longitudee: 31.3181),
  StationModel(name: "Ezbet El-Nakhl", latitude: 30.1392, longitudee: 31.3244),
  StationModel(name: "El-Marg", latitude: 30.1522, longitudee: 31.3356),
  StationModel(name: "New El-Marg", latitude: 30.1633, longitudee: 31.3383),
];

List<StationModel> line2Details = [
  StationModel(
    name: "Shubra El Kheima",
    latitude: 30.1225,
    longitudee: 31.2447,
  ),
  StationModel(
    name: "Koleyet El Zeraa",
    latitude: 30.1139,
    longitudee: 31.2486,
  ),
  StationModel(name: "Mezallat", latitude: 30.1050, longitudee: 31.2467),
  StationModel(name: "Khalafawy", latitude: 30.0981, longitudee: 31.2453),
  StationModel(name: "St. Teresa", latitude: 30.0883, longitudee: 31.2456),
  StationModel(name: "Rod El Farag", latitude: 30.0806, longitudee: 31.2456),
  StationModel(name: "Masarra", latitude: 30.0711, longitudee: 31.2450),
  StationModel(name: "El Shohadaa", latitude: 30.0619, longitudee: 31.2461),
  StationModel(name: "Attaba", latitude: 30.0525, longitudee: 31.2469),
  StationModel(name: "Naguib", latitude: 30.0453, longitudee: 31.2442),
  StationModel(name: "Sadat", latitude: 30.0444, longitudee: 31.2356),
  StationModel(name: "Opera", latitude: 30.0420, longitudee: 31.2253),
  StationModel(name: "Dokki", latitude: 30.0383, longitudee: 31.2119),
  StationModel(name: "El Bohoth", latitude: 30.0358, longitudee: 31.2003),
  StationModel(
    name: "Cairo University",
    latitude: 30.0272,
    longitudee: 31.2011,
  ),
  StationModel(name: "Faisal", latitude: 30.0172, longitudee: 31.2039),
  StationModel(name: "Giza", latitude: 30.0106, longitudee: 31.2070),
  StationModel(name: "Omm El Misryeen", latitude: 30.0053, longitudee: 31.2081),
  StationModel(name: "Sakiat Mekky", latitude: 29.9956, longitudee: 31.2086),
  StationModel(name: "El-Mounib", latitude: 29.9814, longitudee: 31.2120),
];
List<StationModel> line3Details = [
  StationModel(name: "Adly Mansour", latitude: 30.1469, longitudee: 31.4214),
  StationModel(name: "El Haykestep", latitude: 30.1439, longitudee: 31.4047),
  StationModel(
    name: "Omar Ibn El-Khattab",
    latitude: 30.1406,
    longitudee: 31.3930,
  ),
  StationModel(name: "Qobaa", latitude: 30.1347, longitudee: 31.3839),
  StationModel(name: "Hesham Barakat", latitude: 30.1311, longitudee: 31.3728),
  StationModel(name: "El Nozha", latitude: 30.1283, longitudee: 31.3600),
  StationModel(name: "Nadi El-Shams", latitude: 30.1222, longitudee: 31.3439),
  StationModel(name: "Alf Maskan", latitude: 30.1170, longitudee: 31.3397),
  StationModel(
    name: "Heliopolis Square",
    latitude: 30.1081,
    longitudee: 31.3381,
  ),
  StationModel(name: "Haroun", latitude: 30.1000, longitudee: 31.3328),
  StationModel(name: "Al-Ahram", latitude: 30.0914, longitudee: 31.3264),
  StationModel(
    name: "Koleyet El-Banat",
    latitude: 30.0836,
    longitudee: 31.3290,
  ),
  StationModel(name: "Stadium", latitude: 30.0731, longitudee: 31.3175),
  StationModel(name: "Fair Zone", latitude: 30.0733, longitudee: 31.3011),
  StationModel(name: "Abbassia", latitude: 30.0697, longitudee: 31.2808),
  StationModel(name: "Abdou Pasha", latitude: 30.0647, longitudee: 31.2747),
  StationModel(name: "El Geish", latitude: 30.0628, longitudee: 31.2669),
  StationModel(name: "Bab El Shaaria", latitude: 30.0539, longitudee: 31.2561),
  StationModel(name: "Attaba", latitude: 30.0525, longitudee: 31.2469),
  StationModel(name: "Nasser", latitude: 30.0536, longitudee: 31.2389),
  StationModel(name: "Maspero", latitude: 30.0556, longitudee: 31.2322),
  StationModel(name: "Safaa Hegazy", latitude: 30.0625, longitudee: 31.2225),
  StationModel(name: "Kit Kat", latitude: 30.0667, longitudee: 31.2131),
  StationModel(name: "Sudan", latitude: 30.0697, longitudee: 31.2053),
  StationModel(name: "Imbaba", latitude: 30.0750, longitudee: 31.2075),
  StationModel(name: "El-Bohy", latitude: 30.0822, longitudee: 31.2106),
  StationModel(name: "El-Qawmia", latitude: 30.0933, longitudee: 31.2089),
  StationModel(name: "Ring Road", latitude: 30.0964, longitudee: 31.1997),
  StationModel(
    name: "Rod al-Farag Corridor",
    latitude: 30.1019,
    longitudee: 31.1831,
  ),
  StationModel(name: "Tawfikia", latitude: 30.0653, longitudee: 31.2025),
  StationModel(name: "Wadi El Nile", latitude: 30.0583, longitudee: 31.2000),
  StationModel(name: "Gamat El Dowal", latitude: 30.0508, longitudee: 31.1997),
  StationModel(
    name: "Boulak El Dakrour",
    latitude: 30.0361,
    longitudee: 31.1964,
  ),
  StationModel(
    name: "Cairo University",
    latitude: 30.0261,
    longitudee: 31.2011,
  ),
];

//!============================================ اول واحد ==========================================
// import 'dart:io';

// final line1 = [
//   "Helwan",
//   "Ain Helwan",
//   "Helwan University",
//   "Wadi Hof",
//   "Hadayek Helwan",
//   "El-Maasara",
//   "Tora El-Asmant",
//   "Kozzika",
//   "Tora El-Balad",
//   "Sakanat El Maadi",
//   "El Maadi",
//   "Hadayek El Maadi",
//   "Dar El Salam",
//   "El Zahraa",
//   "Mar Girgis",
//   "El Malek El Saleh",
//   "El Sayeda Zeinab",
//   "Saad Zaghloul",
//   "Sadat",
//   "Nasser",
//   "Orabi",
//   "El Shohadaa",
//   "Ghamra",
//   "El Demerdash",
//   "Manshiet El Sadr",
//   "Kobri El Qobba",
//   "Hammamat El Qobba",
//   "Saray El Qobba",
//   "Hadayek El Zaitoun",
//   "Helmeyet El Zeitoun",
//   "El Matariya",
//   "Ain Shams",
//   "Ezbet El Nakhl",
//   "Al Marg",
//   "New El-Marg",
// ];

// final line2 = [
//   "Shubra El Kheima",
//   "Koliet El Zeraa",
//   "Mezallat",
//   "Khalafawy",
//   "St. Teresa",
//   "Rod El Farag",
//   "Masarra",
//   "El Shohadaa",
//   "Attaba",
//   "Naguib",
//   "Sadat",
//   "Opera",
//   "Dokki",
//   "El Bohoth",
//   "Cairo University",
//   "Faisal",
//   "Giza",
//   "Omm El Misryeen",
//   "Sakiat Mekky",
//   "El-Mounib",
// ];

// final line3Main = [
//   "Adly Mansour",
//   "El Haykestep",
//   "Omar Ibn El Khattab",
//   "Qobaa",
//   "Hesham Barakat",
//   "El Nozha",
//   "Nadi El Shams",
//   "Alf Maskan",
//   "Heliopolis",
//   "Haroun",
//   "Al Ahram",
//   "Kolleyet El Banat",
//   "Stadium",
//   "Fair Zone",
//   "Abbassiya",
//   "Abdou Pasha",
//   "El Geish",
//   "Bab El Shaaria",
//   "Attaba",
//   "Nasser",
//   "Maspero",
//   "Safaa Hegazy",
//   "Kit Kat",
// ];

// final line3Branch1 = [
//   "Kit Kat",
//   "Sudan",
//   "Imbaba",
//   "El-Bohy",
//   "El-Qawmia",
//   "Ring Road",
//   "Rod al-Farag Corridor",
// ];

// final line3Branch2 = [
//   "Kit Kat",
//   "Tawfikia",
//   "Wadi El Nile",
//   "Gamat El Dowal",
//   "Boulak El Dakrour",
//   "Cairo University",
// ];

// final allLines = [line1, line2, line3Main, line3Branch1, line3Branch2];

// final commonStations = [
//   'Nasser',
//   'Attaba',
//   'El Shohadaa',
//   'Sadat',
//   'Cairo University',
//   'Kit Kat',
// ];

// final lineEnds = {
//   line1: ["Helwan", "New El-Marg"],
//   line2: ["Shubra El Kheima", "El-Mounib"],
//   line3Main: ["Adly Mansour", "Kit Kat"],
//   line3Branch1: ["Kit Kat", "Rod al-Farag Corridor"],
//   line3Branch2: ["Kit Kat", "Cairo University"],
// };

// class Details {
//   int? stationCount;
//   int? time;
//   int? ticketPrice;
//   List<List<String>>? routes = [];
//   List<String>? directions = [];

//   void clear() {
//     directions?.clear();
//     routes?.clear();
//     stationCount = null;
//     time = null;
//     ticketPrice = null;
//   }
// }

// void main() {
//   print("Enter start station:");
//   String start = stdin.readLineSync()!;
//   print("Enter destination station:");
//   String end = stdin.readLineSync()!;

//   final visited = <String>{};
//   final path = <String>[];

//   final result = findShortestPath(start, end, visited, path);

//   if (result.isNotEmpty) {
//     final details = buildDetails(result);

//     print("✅ Found Path:");
//     for (int i = 0; i < details.routes!.length; i++) {
//       print("Route ${i + 1}: ${details.routes![i].join(" → ")}");
//       print("Direction: ${details.directions![i]}\n");
//     }
//     print("Total stations: ${details.stationCount}");
//     print("Estimated time: ${details.time} minutes");
//     print("Ticket price: ${details.ticketPrice} EGP");
//   } else {
//     print("No path found between $start and $end");
//   }
// }

// List<String> findShortestPath(
//   String current,
//   String destination,
//   Set<String> visited,
//   List<String> path,
// ) {
//   if (visited.contains(current)) return [];

//   visited.add(current);
//   path.add(current);

//   if (current == destination) return List.from(path);

//   List<String> shortest = [];

//   for (var line in allLines) {
//     if (!line.contains(current)) continue;

//     final index = line.indexOf(current);
//     final neighbors = <String>[];

//     if (index > 0) neighbors.add(line[index - 1]);
//     if (index < line.length - 1) neighbors.add(line[index + 1]);

//     for (var neighbor in neighbors) {
//       if (visited.contains(neighbor)) continue;

//       final newPath = findShortestPath(
//         neighbor,
//         destination,
//         Set.from(visited),
//         List.from(path),
//       );
//       if (newPath.isNotEmpty &&
//           (shortest.isEmpty || newPath.length < shortest.length)) {
//         shortest = newPath;
//       }
//     }
//   }

//   return shortest;
// }

// String getDirection(String start, String end) {
//   for (var line in allLines) {
//     if (line.contains(start) && line.contains(end)) {
//       final startIndex = line.indexOf(start);
//       final endIndex = line.indexOf(end);

//       if (startIndex < endIndex) {
//         return "اتجاه ${lineEnds[line]![1]}";
//       } else {
//         return "اتجاه ${lineEnds[line]![0]}";
//       }
//     }
//   }
//   return "اتجاه غير معروف";
// }

// Details buildDetails(List<String> path) {
//   final details = Details();
//   final routes = <List<String>>[];
//   final directions = <String>[];
//   var currentRoute = <String>[];

//   for (int i = 0; i < path.length; i++) {
//     currentRoute.add(path[i]);

//     if (i < path.length - 1 &&
//         commonStations.contains(path[i]) &&
//         currentRoute.length > 1) {
//       routes.add(List.from(currentRoute));
//       directions.add(getDirection(currentRoute.first, currentRoute.last));
//       currentRoute = [path[i]];
//     }
//   }

//   if (currentRoute.isNotEmpty) {
//     routes.add(currentRoute);
//     directions.add(getDirection(currentRoute.first, currentRoute.last));
//   }

//   details.routes = routes;
//   details.directions = directions;
//   details.stationCount = path.length - 1;
//   details.time = details.stationCount! * 2;

//   if (details.stationCount! <= 9) {
//     details.ticketPrice = 8;
//   } else if (details.stationCount! <= 16) {
//     details.ticketPrice = 10;
//   } else {
//     details.ticketPrice = 15;
//   }

//   return details;
// }
//!============================== مظبوط =========================================

// import 'dart:io';

// final line1 = [
//   "Helwan",
//   "Ain Helwan",
//   "Helwan University",
//   "Wadi Hof",
//   "Hadayek Helwan",
//   "El-Maasara",
//   "Tora El-Asmant",
//   "Kozzika",
//   "Tora El-Balad",
//   "Sakanat El Maadi",
//   "El Maadi",
//   "Hadayek El Maadi",
//   "Dar El Salam",
//   "El Zahraa",
//   "Mar Girgis",
//   "El Malek El Saleh",
//   "El Sayeda Zeinab",
//   "Saad Zaghloul",
//   "Sadat",
//   "Nasser",
//   "Orabi",
//   "El Shohadaa",
//   "Ghamra",
//   "El Demerdash",
//   "Manshiet El Sadr",
//   "Kobri El Qobba",
//   "Hammamat El Qobba",
//   "Saray El Qobba",
//   "Hadayek El Zaitoun",
//   "Helmeyet El Zeitoun",
//   "El Matariya",
//   "Ain Shams",
//   "Ezbet El Nakhl",
//   "Al Marg",
//   "New El-Marg",
// ];

// final line2 = [
//   "Shubra El Kheima",
//   "Koliet El Zeraa",
//   "Mezallat",
//   "Khalafawy",
//   "St. Teresa",
//   "Rod El Farag",
//   "Masarra",
//   "El Shohadaa",
//   "Attaba",
//   "Naguib",
//   "Sadat",
//   "Opera",
//   "Dokki",
//   "El Bohoth",
//   "Cairo University",
//   "Faisal",
//   "Giza",
//   "Omm El Misryeen",
//   "Sakiat Mekky",
//   "El-Mounib",
// ];

// final line3Main = [
//   "Adly Mansour",
//   "El Haykestep",
//   "Omar Ibn El Khattab",
//   "Qobaa",
//   "Hesham Barakat",
//   "El Nozha",
//   "Nadi El Shams",
//   "Alf Maskan",
//   "Heliopolis",
//   "Haroun",
//   "Al Ahram",
//   "Kolleyet El Banat",
//   "Stadium",
//   "Fair Zone",
//   "Abbassiya",
//   "Abdou Pasha",
//   "El Geish",
//   "Bab El Shaaria",
//   "Attaba",
//   "Nasser",
//   "Maspero",
//   "Safaa Hegazy",
//   "Kit Kat",
// ];

// final line3Branch1 = [
//   "Kit Kat",
//   "Sudan",
//   "Imbaba",
//   "El-Bohy",
//   "El-Qawmia",
//   "Ring Road",
//   "Rod al-Farag Corridor",
// ];

// final line3Branch2 = [
//   "Kit Kat",
//   "Tawfikia",
//   "Wadi El Nile",
//   "Gamat El Dowal",
//   "Boulak El Dakrour",
//   "Cairo University",
// ];

// final allLines = [line1, line2, line3Main, line3Branch1, line3Branch2];

// class Details {
//   int? stationCount;
//   int? time;
//   int? ticketPrice;
//   List<List<String>>? routes = [];
//   List<String>? directions = [];

//   void clear() {
//     directions?.clear();
//     routes?.clear();
//     stationCount = null;
//     time = null;
//     ticketPrice = null;
//   }
// }

// List<String> findShortestPath(
//   String current,
//   String destination,
//   Set<String> visited,
//   List<String> path,
// ) {
//   if (visited.contains(current)) return [];

//   visited.add(current);
//   path.add(current);

//   if (current == destination) return List.from(path);

//   List<String> shortest = [];

//   for (var line in allLines) {
//     if (!line.contains(current)) continue;

//     final index = line.indexOf(current);
//     final neighbors = <String>[];

//     if (index > 0) neighbors.add(line[index - 1]);
//     if (index < line.length - 1) neighbors.add(line[index + 1]);

//     for (var neighbor in neighbors) {
//       if (visited.contains(neighbor)) continue;

//       final newPath = findShortestPath(
//         neighbor,
//         destination,
//         Set.from(visited),
//         List.from(path),
//       );
//       if (newPath.isNotEmpty &&
//           (shortest.isEmpty || newPath.length < shortest.length)) {
//         shortest = newPath;
//       }
//     }
//   }

//   return shortest;
// }

// Details generateDetails(List<String> path) {
//   final details = Details();
//   if (path.isEmpty) return details;

//   details.stationCount = path.length - 1;
//   details.time = details.stationCount! * 2;
//   details.ticketPrice = details.stationCount! <= 9
//       ? 5
//       : details.stationCount! <= 16
//           ? 7
//           : 10;

//   List<String> currentRoute = [path.first];
//   String currentLine = findLineOfStation(path.first);

//   for (int i = 1; i < path.length; i++) {
//     String station = path[i];
//     String line = findLineOfStation(station);

//     if (line != currentLine) {
//       // transfer
//       details.routes?.add(List.from(currentRoute));
//       details.directions?.add("Change at ${path[i - 1]} to $line");
//       currentRoute = [path[i - 1], station];
//       currentLine = line;
//     } else {
//       currentRoute.add(station);
//     }
//   }
//   details.routes?.add(currentRoute);

//   return details;
// }

// String findLineOfStation(String station) {
//   if (line1.contains(station)) return "Line 1";
//   if (line2.contains(station)) return "Line 2";
//   if (line3Main.contains(station) ||
//       line3Branch1.contains(station) ||
//       line3Branch2.contains(station)) return "Line 3";
//   return "Unknown Line";
// }

// void main() {
//   print("Enter start station:");
//   String start = stdin.readLineSync()!;
//   print("Enter destination station:");
//   String end = stdin.readLineSync()!;

//   final path = findShortestPath(start, end, {}, []);
//   if (path.isEmpty) {
//     print("No path found between $start and $end");
//     return;
//   }

//   final details = generateDetails(path);

//   print("\n=== Trip Details ===");
//   print("Route: ${path.join(" → ")}");
//   print("Stations: ${details.stationCount}");
//   print("Time: ${details.time} minutes");
//   print("Ticket Price: ${details.ticketPrice} EGP");

//   if (details.directions!.isNotEmpty) {
//     print("\nTransfers:");
//     for (var d in details.directions!) {
//       print("- $d");
//     }
//   } else {
//     print("\nNo transfers needed.");
//   }

//   print("\nRoutes breakdown:");
//   for (var r in details.routes!) {
//     print(r.join(" → "));
//   }
// }
