import 'package:flutter/material.dart';
import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/utilities/app_color.dart';
import 'package:go_metro/generated/l10n.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class StationModel {
  @Id()
  int id = 0;
  final String name;
  final String? transferBetween;
  final int index;
  int? order;
  final double travellingTime;
  final double longitude;
  final double latitude;
  final int lineColorValue;
  final route = ToOne<RouteModel>();
  StationModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.index,
    required this.travellingTime,
    this.transferBetween,
    required this.lineColorValue,
  });
  factory StationModel.fromJson({required final Map<String, dynamic> json}) =>
      StationModel(
        name: json["name"] as String,
        latitude: (json["latitude"] as num).toDouble(),
        longitude: (json["longitude"] as num).toDouble(),
        index: json["index"] as int,
        travellingTime: (json["travellingTime"] as num).toDouble(),
        lineColorValue: json["lineColorValue"] as int,
        transferBetween: json["transferBetween"] as String?,
      );

  Color get lineColor => Color(lineColorValue);

  String getTransferBetween(BuildContext context) {
    final s = S.of(context);
    switch (transferBetween) {
      case "is Transfer station between\nLine 1 and Line 3":
        return s.transferBetween13;
      case "is Transfer station between\nLine 2 and Line 3":
        return s.transferBetween23;
      case "is Transfer station between\nLine 1 and Line 2":
        return s.transferBetween12;
      case "is Transfer station between\nimbaba branch and cairo Uni branch":
        return s.transferBetween33;
      default:
        return "";
    }
  }

  static String getLine(Color lineColor, BuildContext context) {
    final s = S.of(context);
    if (AppColor.line1Color == lineColor) {
      return s.Line1;
    } else if (AppColor.line2Color == lineColor) {
      return s.Line2;
    } else if (AppColor.line3Color == lineColor) {
      return s.Line3;
    }
    return s.Line3;
  }

  String? getStationName() {
    final s = S.current;
    if (lineColor == AppColor.line1Color) {
      switch (name) {
        case "Helwan":
          return s.Helwan;
        case "Ain Helwan":
          return s.Ain_Helwan;

        case "Helwan University":
          return s.Helwan_University;
        case "Wadi Hof":
          return s.Wadi_Hof;
        case "Hadayek Helwan":
          return s.Hadayek_Helwan;
        case "El-Maasara":
          return s.El_Maasara;
        case "Tora El-Asmant":
          return s.Tora_El_Asmant;
        case "Kozzika":
          return s.Kozzika;
        case "Tora El-Balad":
          return s.Tora_El_Balad;
        case "Sakanat El-Maadi":
          return s.Sakanat_El_Maadi;
        case "El-Maadi":
          return s.El_Maadi;
        case "Hadayek El-Maadi":
          return s.Hadayek_El_Maadi;
        case "Dar El-Salam":
          return s.Dar_El_Salam;
        case "El-Zahraa":
          return s.El_Zahraa;
        case "Mar Girgis":
          return s.Mar_Girgis;
        case "El-Malek El-Saleh":
          return s.El_Malek_El_saleh;
        case "El-Sayeda Zeinab":
          return s.El_Sayeda_Zeinab;
        case "Saad Zaghloul":
          return s.Saad_Zaghloul;
        case "El-Sadat":
          return s.El_Sadat;
        case "Nasser":
          return s.Nasser;
        case "Orabi":
          return s.Orabi;
        case "El-Shohadaa":
          return s.El_Shohadaa;
        case "Ghamra":
          return s.Ghamra;
        case "El-Demerdash":
          return s.El_Demerdash;
        case "Manshyet El-Sadr":
          return s.Manshyet_El_Sadr;
        case "Kobry El-Qubba":
          return s.Kobry_El_Qubba;
        case "Hammamet El-Qubba":
          return s.Hammamet_El_Qubba;
        case "Saray El-Qubba":
          return s.Saray_El_Qubba;
        case "Hadayek El-Zaytoun":
          return s.Hadayek_El_Zaytoun;
        case "Helmayet El-Zaytoun":
          return s.Helmayet_El_Zaytoun;
        case "El-Mattareya":
          return s.El_Mattareya;
        case "Ain Shams":
          return s.Ain_Shams;
        case "Ezbet El-Nakhl":
          return s.Ezbet_El_Nakhl;
        case "Al-Marg":
          return s.Al_Marg;
        case "New El-Marg":
          return s.New_El_Marg;
        default:
          return null;
      }
    } else if (lineColor == AppColor.line2Color) {
      switch (name) {
        case "Shubra El-Kheima":
          return s.Shubra_El_Kheima;
        case "Koleyet El-Zeraa":
          return s.Koleyet_El_Zeraa;
        case "El-Mezallat":
          return s.El_Mezallat;
        case "El-Khalafawy":
          return s.El_Khalafawy;
        case "Saint Theresa":
          return s.Saint_Theresa;
        case "Rod El-Farag":
          return s.Rod_El_Farag;
        case "Massara":
          return s.Massara;
        case "El-Shohadaa":
          return s.El_Shohadaa;
        case "Attaba":
          return s.Attaba;
        case "Nageeb":
          return s.Nageeb;
        case "El-Sadat":
          return s.El_Sadat;

        case "Opera":
          return s.Opera;
        case "Dokki":
          return s.Dokki;
        case "El-Behoos":
          return s.El_Behoos;
        case "Cairo University":
          return s.Cairo_University;
        case "Faysal":
          return s.Faysal;
        case "Giza":
          return s.Giza;
        case "Omm El-Masryeen":
          return s.Omm_El_Masryeen;
        case "Sakyet-Mekky":
          return s.Sakyet_Mekky;
        case "El-Moneeb":
          return s.El_Moneeb;
        default:
          return null;
      }
    } else {
      switch (name) {
        case "Adly Mansour":
          return s.Adly_Mansour;
        case "El-Haikstep":
          return s.El_Haikstep;
        case "Omar Ibn El-Khattab":
          return s.Omar_Ibn_El_Khattab;
        case "Qebaa":
          return s.Qebaa;
        case "Hesham Barakat":
          return s.Hesham_Barakat;
        case "Nozha":
          return s.Nozha;
        case "El-Shams Club":
          return s.El_Shams_Club;
        case "Alf Masken":
          return s.Alf_Masken;
        case "Heliopolis":
          return s.Heliopolis;
        case "Haroun":
          return s.Haroun;
        case "El-Ahram":
          return s.El_Ahram;
        case "Kolleyet El-Banat":
          return s.Kolleyet_El_Banat;
        case "Stadium":
          return s.Stadium;

        case "Fair Zone":
          return s.Fair_Zone;
        case "El-Abassiya":
          return s.El_Abassiya;
        case "Abdou Pasha":
          return s.Abdou_Pasha;
        case "El-Geish":
          return s.El_Geish;
        case "Bab El-Shaariya":
          return s.Bab_El_Shaariya;
        case "Attaba":
          return s.Attaba;
        case "Nasser":
          return s.Nasser;
        case "Maspero":
          return s.Maspero;
        case "Safaa Hegazy":
          return s.Safaa_Hegazy;
        case "Kit-Kat":
          return s.Kit_Kat;
        case "Sudan":
          return s.Sudan;
        case "Imbaba":
          return s.Imbaba;
        case "El-Bohy":
          return s.El_Bohy;
        case "El-Qawmia":
          return s.El_Qawmia;
        case "Ring Road":
          return s.Ring_Road;
        case "Rod El Farag Corr":
          return s.Rod_El_Farag_Corr;
        case "Tawfikia":
          return s.Tawfikia;
        case "Wadi El-Nile":
          return s.Wadi_El_Nile;
        case "Gamet El-Dowel":
          return s.Gamet_El_Dowel;
        case "Boulak El-Dakrour":
          return s.Boulak_El_Dakrour;
        case "Cairo University":
          return s.Cairo_University;
        default:
          return null;
      }
    }
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