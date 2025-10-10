import 'package:flutter/material.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/generated/l10n.dart';

class StationModel {
  String? name;
  String? transferBetween;
  int? index;
  double? travellingTime;
  double? longitudee;
  double? latitude;
  Color? lineColor;
  StationModel({
    this.name,
    this.latitude,
    this.longitudee,
    this.lineColor,
    this.index,
    this.travellingTime,
    this.transferBetween
  });
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "index": index,
      "travellingTime": travellingTime,
      "longitudee": longitudee,
      'latitude': latitude,
      'lineColor': lineColor,
    };
  }

  factory StationModel.fromMap(Map<String, dynamic> map) {
    return StationModel(
      name: map["name"],
      index: map["index"],
      travellingTime: map["travellingTime"],
      longitudee: map["longitudee"],
      latitude: map['latitude'],

      lineColor: map['lineColor'],
    );
  }

  static String getLine(Color lineColor, BuildContext context) {
    if (AppColor.line1Color == lineColor) {
      return S.of(context).Line1;
    } else if (AppColor.line2Color == lineColor) {
      return S.of(context).Line2;
    } else if (AppColor.line3Color == lineColor) {
      return S.of(context).Line3;
    }
    return S.of(context).Line3;
  }
}
// "Helwan":"Helwan",
//   "Ain Helwan":"Ain Helwan",
//   "Helwan University":"Helwan University",
//   "Wadi Hof":"Wadi Hof",
//   "Hadayek Helwan":"Hadayek Helwan",
//   "El-Maasara":"El-Maasara",
//   "Tora El-Asmant":"Tora El-Asmant",
//   "Kozzika":"Kozzika",
//   "Tora El-Balad":"Tora El-Balad",
//   "Sakanat El-Maadi":"Sakanat El-Maadi",
//   "El-Maadi":"El-Maadi",
//   "Hadayek El-Maadi":"Hadayek El-Maadi",
//   "Dar El-Salam":"Dar El-Salam",
//   "El-Zahraa":"El-Zahraa",
//   "Mar Girgis":"Mar Girgis",
//   "El-Malek El-Saleh":"El-Malek El-Saleh",
//   "El-Sayeda Zeinab":"El-Sayeda Zeinab",
//   "Saad Zaghloul":"Saad Zaghloul",
//   "El-Sadat":"El-Sadat",
//   "Orabi":"Orabi",
//   "El-Shohadaa":"El-Shohadaa",
//   "Ghamra":"Ghamra",
//   "El-Demerdash":"El-Demerdash",
//   "Manshyet El-Sadr":"Manshyet El-Sadr",
//   "Kobry El-Qubba":"Kobry El-Qubba",
//   "Hammamet El-Qubba":"Hammamet El-Qubba",
//   "Saray El-Qubba":"Saray El-Qubba",
//   "Hadayek El-Zaytoun":"Hadayek El-Zaytoun",
//   "Helmayet El-Zaytoun":"Helmayet El-Zaytoun",
//   "El-Mattareya":"El-Mattareya",
//   "Ain Shams":"Ain Shams",
//   "Ezbet El-Nakhl":"Ezbet El-Nakhl",
//   "Al-Marg":"Al-Marg",
//   "New El-Marg":"New El-Marg",
//   "Shubra El-Kheima":"Shubra El-Kheima",
//   "Koleyet El-Zeraa":"Koleyet El-Zeraa",
//   "El-Mezallat":"El-Mezallat",
//   "El-Khalafawy":"El-Khalafawy",
//   "Saint Theresa":"Saint Theresa",
//   "Rod El-Farag":"Rod El-Farag",
//   "Massara":"Massara",
//   "Nageeb":"Nageeb",
//   "Opera":"Opera",
//   "Dokki":"Dokki",
//   "El-Behoos":"El-Behoos",
//   "Cairo University": "Cairo University",
//   "Faysal": "Faysal",
//   "Giza":"Giza",
//   "Omm El-Masryeen":"Omm El-Masryeen",
//   "Sakyet-Mekky":"Sakyet-Mekky",
//   "El-Moneeb":"El-Moneeb",
//   "Adly Mansour":"Adly Mansour",
//   "El-Haikstep":"El-Haikstep",
//   "Omar Ibn El-Khattab":  "Omar Ibn El-Khattab",
//   "Qebaa":"Qebaa",
//   "Hesham Barakat":"Hesham Barakat",
//   "Nozha":"Nozha",
//   "El-Shams Club":"El-Shams Club",
//   "Alf Masken":"Alf Masken",
//   "Heliopolis":"Heliopolis",
//   "Haroun":"Haroun",
//   "El-Ahram": "El-Ahram",
//   "Kolleyet El-Banat":"Kolleyet El-Banat",
//   "Stadium":"Stadium",
//   "Fair Zone": "Fair Zone",
//   "El-Abassiya":"El-Abassiya",
//   "Abdou Pasha":"Abdou Pasha",
//   "El-Geish":"El-Geish",
//   "Bab El-Shaariya": "Bab El-Shaariya",
//   "Attaba": "Attaba",
//   "Nasser":"Nasser",
//   "Maspero":"Maspero",
//   "Safaa Hegazy": "Safaa Hegazy",
//   "Kit-Kat":"Kit-Kat",
//   "Sudan":"Sudan",
//   "Imbaba":"Imbaba",
//   "El-Bohy":"El-Bohy",
//   "El-Qawmia": "El-Qawmia",
//   "Ring Road":"Ring Road",
//   "Rod El Farag Corr": "Rod El Farag Corr",
//   "Tawfikia":"Tawfikia",
//   "Wadi El-Nile":"Wadi El-Nile",
//   "Gamet El-Dowel":"Gamet El-Dowel",
//   "Boulak El-Dakrour":"Boulak El-Dakrour"