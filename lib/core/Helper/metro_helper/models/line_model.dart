import 'package:flutter/material.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/station_model.dart';
import 'package:metro_egypt_guide/core/utilities/app_color.dart';

class LineModel {
  final List<StationModel> stations;
  final Color lineColor;
  final String lineName;

  LineModel({
    required this.lineColor,
    required this.lineName,
    required this.stations,
  });
}

LineModel line1 = LineModel(
  lineColor: AppColor.line1Color,
  lineName: 'Line 1',
  stations: [
    StationModel(
      name: "Helwan",
      latitude: 29.8490,
      longitudee: 31.3342,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Ain Helwan",
      latitude: 29.8628,
      longitudee: 31.3250,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Helwan University",
      latitude: 29.8689,
      longitudee: 31.3203,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Wadi Hof",
      latitude: 29.8794,
      longitudee: 31.3133,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Hadayek Helwan",
      latitude: 29.8972,
      longitudee: 31.3042,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "El-Maasara",
      latitude: 29.9061,
      longitudee: 31.2997,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Tora El-Asmant",
      latitude: 29.9258,
      longitudee: 31.2878,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Kozzika",
      latitude: 29.9361,
      longitudee: 31.2817,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Tora El-Balad",
      latitude: 29.9464,
      longitudee: 31.2736,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Sakanat El-Maadi",
      latitude: 29.9528,
      longitudee: 31.2633,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "El Maadi",
      latitude: 29.9597,
      longitudee: 31.2581,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Hadayek El-Maadi",
      latitude: 29.9700,
      longitudee: 31.2506,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Dar El-Salam",
      latitude: 29.9819,
      longitudee: 31.2422,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "El-Zahraa'",
      latitude: 29.9953,
      longitudee: 31.2317,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Mar Girgis",
      latitude: 30.0058,
      longitudee: 31.2294,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "El-Malek El-Saleh",
      latitude: 30.0169,
      longitudee: 31.2310,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Al-Sayeda Zeinab",
      latitude: 30.0292,
      longitudee: 31.2353,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Saad Zaghloul",
      latitude: 30.0367,
      longitudee: 31.2381,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Sadat",
      latitude: 30.0444,
      longitudee: 31.2356,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Nasser",
      latitude: 30.0536,
      longitudee: 31.2389,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Orabi",
      latitude: 30.0575,
      longitudee: 31.2425,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Al-Shohadaa",
      latitude: 30.0620,
      longitudee: 31.2461,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Ghamra",
      latitude: 30.0689,
      longitudee: 31.2647,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "El-Demerdash",
      latitude: 30.0772,
      longitudee: 31.2778,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Manshiet El-Sadr",
      latitude: 30.0822,
      longitudee: 31.2878,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      name: "Kobri El-Qobba",
      latitude: 30.0870,
      longitudee: 31.2939,
      lineColor: AppColor.line1Color,
    ),
    StationModel(
      lineColor: AppColor.line1Color,
      name: "Hammamat El-Qobba",
      latitude: 30.0903,
      longitudee: 31.2981,
    ),
    StationModel(
      lineColor: AppColor.line1Color,
      name: "Saray El-Qobba",
      latitude: 30.0981,
      longitudee: 31.3047,
    ),
    StationModel(
      lineColor: AppColor.line1Color,
      name: "Hadayeq El-Zaitoun",
      latitude: 30.1053,
      longitudee: 31.3100,
    ),
    StationModel(
      lineColor: AppColor.line1Color,
      name: "Helmeyet El-Zaitoun",
      latitude: 30.1144,
      longitudee: 31.3139,
    ),
    StationModel(
      lineColor: AppColor.line1Color,
      name: "El-Matareyya",
      latitude: 30.1214,
      longitudee: 31.3139,
    ),
    StationModel(
      name: "Ain Shams",
      lineColor: AppColor.line1Color,
      latitude: 30.1311,
      longitudee: 31.3181,
    ),
    StationModel(
      lineColor: AppColor.line1Color,
      name: "Ezbet El-Nakhl",
      latitude: 30.1392,
      longitudee: 31.3244,
    ),
    StationModel(
      lineColor: AppColor.line1Color,
      name: "El-Marg",
      latitude: 30.1522,
      longitudee: 31.3356,
    ),
    StationModel(
      lineColor: AppColor.line1Color,
      name: "New El-Marg",
      latitude: 30.1633,
      longitudee: 31.3383,
    ),
  ],
);
LineModel line2 = LineModel(
  lineColor: AppColor.line2Color,
  lineName: 'Line 2',
  stations: [
    StationModel(
      name: "Shubra El Kheima",
      latitude: 30.1225,
      longitudee: 31.2447,
      lineColor: AppColor.line2Color,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Koleyet El Zeraa",
      latitude: 30.1139,
      longitudee: 31.2486,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Mezallat",
      latitude: 30.1050,
      longitudee: 31.2467,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Khalafawy",
      latitude: 30.0981,
      longitudee: 31.2453,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "St. Teresa",
      latitude: 30.0883,
      longitudee: 31.2456,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Rod El Farag",
      latitude: 30.0806,
      longitudee: 31.2456,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Masarra",
      latitude: 30.0711,
      longitudee: 31.2450,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "El Shohadaa",
      latitude: 30.0619,
      longitudee: 31.2461,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Attaba",
      latitude: 30.0525,
      longitudee: 31.2469,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Naguib",
      latitude: 30.0453,
      longitudee: 31.2442,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Sadat",
      latitude: 30.0444,
      longitudee: 31.2356,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Opera",
      latitude: 30.0420,
      longitudee: 31.2253,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Dokki",
      latitude: 30.0383,
      longitudee: 31.2119,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "El Bohoth",
      latitude: 30.0358,
      longitudee: 31.2003,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Cairo University",
      latitude: 30.0272,
      longitudee: 31.2011,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Faisal",
      latitude: 30.0172,
      longitudee: 31.2039,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Giza",
      latitude: 30.0106,
      longitudee: 31.2070,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Omm El Misryeen",
      latitude: 30.0053,
      longitudee: 31.2081,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "Sakiat Mekky",
      latitude: 29.9956,
      longitudee: 31.2086,
    ),
    StationModel(
      lineColor: AppColor.line2Color,
      name: "El-Mounib",
      latitude: 29.9814,
      longitudee: 31.2120,
    ),
  ],
);
LineModel line3Main = LineModel(
  lineColor: AppColor.line3Color,
  lineName: 'Line 3',
  stations: [
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Adly Mansour",
      latitude: 30.1469,
      longitudee: 31.4214,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "El Haykestep",
      latitude: 30.1439,
      longitudee: 31.4047,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Omar Ibn El-Khattab",
      latitude: 30.1406,
      longitudee: 31.3930,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Qobaa",
      latitude: 30.1347,
      longitudee: 31.3839,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Hesham Barakat",
      latitude: 30.1311,
      longitudee: 31.3728,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "El Nozha",
      latitude: 30.1283,
      longitudee: 31.3600,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Nadi El-Shams",
      latitude: 30.1222,
      longitudee: 31.3439,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Alf Maskan",
      latitude: 30.1170,
      longitudee: 31.3397,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Heliopolis Square",
      latitude: 30.1081,
      longitudee: 31.3381,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Haroun",
      latitude: 30.1000,
      longitudee: 31.3328,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Al-Ahram",
      latitude: 30.0914,
      longitudee: 31.3264,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Koleyet El-Banat",
      latitude: 30.0836,
      longitudee: 31.3290,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Stadium",
      latitude: 30.0731,
      longitudee: 31.3175,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Fair Zone",
      latitude: 30.0733,
      longitudee: 31.3011,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Abbassia",
      latitude: 30.0697,
      longitudee: 31.2808,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Abdou Pasha",
      latitude: 30.0647,
      longitudee: 31.2747,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "El Geish",
      latitude: 30.0628,
      longitudee: 31.2669,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Bab El Shaaria",
      latitude: 30.0539,
      longitudee: 31.2561,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Attaba",
      latitude: 30.0525,
      longitudee: 31.2469,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Nasser",
      latitude: 30.0536,
      longitudee: 31.2389,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Maspero",
      latitude: 30.0556,
      longitudee: 31.2322,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Safaa Hegazy",
      latitude: 30.0625,
      longitudee: 31.2225,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Kit Kat",
      latitude: 30.0667,
      longitudee: 31.2131,
    ),
  ],
);

LineModel line3Branch1 = LineModel(
  lineColor: AppColor.line3Color,
  lineName: 'Imbaba Branch',
  stations: [
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Sudan",
      latitude: 30.0697,
      longitudee: 31.2053,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Imbaba",
      latitude: 30.0750,
      longitudee: 31.2075,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "El-Bohy",
      latitude: 30.0822,
      longitudee: 31.2106,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "El-Qawmia",
      latitude: 30.0933,
      longitudee: 31.2089,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Ring Road",
      latitude: 30.0964,
      longitudee: 31.1997,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Rod al-Farag Corridor",
      latitude: 30.1019,
      longitudee: 31.1831,
    ),
  ],
);
LineModel line3Branch2 = LineModel(
  lineColor: AppColor.line3Color,
  lineName: 'Cairo University Branch',
  stations: [
    
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Tawfikia",
      latitude: 30.0653,
      longitudee: 31.2025,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Wadi El Nile",
      latitude: 30.0583,
      longitudee: 31.2000,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Gamat El Dowal",
      latitude: 30.0508,
      longitudee: 31.1997,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Boulak El Dakrour",
      latitude: 30.0361,
      longitudee: 31.1964,
    ),
    StationModel(
      lineColor: AppColor.line3Color,
      name: "Cairo University",
      latitude: 30.0261,
      longitudee: 31.2011,
    ),
  ],
);

List<StationModel> commonStations = [
  StationModel(
    lineColor: AppColor.line3Color,
    name: "Nasser",
    latitude: 30.0536,
    longitudee: 31.2389,
  ),
  StationModel(
    lineColor: AppColor.line3Color,
    name: "Attaba",
    latitude: 30.0525,
    longitudee: 31.2469,
  ),
  StationModel(
    lineColor: AppColor.line2Color,
    name: "El Shohadaa",
    latitude: 30.0619,
    longitudee: 31.2461,
  ),
  StationModel(
    lineColor: AppColor.line1Color,
    name: "Sadat",
    latitude: 30.0444,
    longitudee: 31.2356,
  ),
  StationModel(
    lineColor: AppColor.line3Color,
    name: "Cairo University",
    latitude: 30.0261,
    longitudee: 31.2011,
  ),
  StationModel(
    lineColor: AppColor.line3Color,
    name: "Kit Kat",
    latitude: 30.0667,
    longitudee: 31.2131,
  ),
];
