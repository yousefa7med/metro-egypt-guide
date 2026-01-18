import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_metro/core/Helper/functions/functions.dart';
import 'package:go_metro/core/Helper/metro_helper/metro_helper.dart';
import 'package:go_metro/core/Helper/metro_helper/models/line_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/errors/app_exeption.dart';
import 'package:go_metro/generated/l10n.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit() : super(TripInitialState()) {
    init();
  }

  String? getStationName(String station) {
    final s = S.current;

    switch (station) {
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

      case "Attaba":
        return s.Attaba;
      case "Nageeb":
        return s.Nageeb;

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

      default:
        return null;
    }
  }

  Metro metro = Metro();

  Position? position;
  StationModel? nearestStation;
  static TripCubit get(context) => BlocProvider.of(context);
  final List<DropdownMenuEntry<String>> startStationList = [];
  final List<DropdownMenuEntry<String>> finalStationList = [];

  final TextEditingController startStationController = TextEditingController();
  final TextEditingController finalStationController = TextEditingController();
  StationModel? lastStartStation;
  StationModel? lastFinalStation;
  String? startStation;
  String? lastStation;
  void init() {
    startStationList.clear();
    finalStationList.clear();
    startStationController.clear();
    finalStationController.clear();
    if (isArabic()) {
      String localStation;
      for (var station in allStations) {
        localStation = getStationName(station)!;

        startStationList.add(
          DropdownMenuEntry(value: station, label: localStation),
        );
        finalStationList.add(
          DropdownMenuEntry(value: station, label: localStation),
        );
      }
    } else {
      for (var station in allStations) {
        startStationList.add(DropdownMenuEntry(value: station, label: station));
        finalStationList.add(DropdownMenuEntry(value: station, label: station));
      }
    }
  }

  TripDetailsModel getTripDetails() {
    try {
      final String start = startStation!.trim();
      final String end = lastStation!.trim();
      return metro.getTripDetails(start, end);
    } catch (e) {
      throw TripDetailsException(message: S.current.checkDetails);
    }
  }

  Function(dynamic)? startStationsOnSelectedFunction({BuildContext? context}) {
    return (value) {
      startStation = value;

      lastStartStation ??= StationModel();

      if (lastStartStation!.name != null &&
          !finalStationList.any((e) => e.value == lastStartStation!.name)) {
        finalStationList.insert(
          lastStartStation!.index!,
          DropdownMenuEntry(
            value: lastStartStation!.name!,
            label: getStationName(lastStartStation!.name!)!,
          ),
        );
      }

      lastStartStation!.name = value;
      lastStartStation!.index = finalStationList.indexWhere(
        (e) => e.value == value,
      );

      finalStationList.removeWhere((e) => e.value == value);
      if (context != null) {
        FocusScope.of(context).unfocus();
      }
      emit(TripDetailsChangesState());
    };
  }

  Function(dynamic)? finalStationsOnSelectedFunction({BuildContext? context}) {
    return (value) {
      lastStation = value;
      lastFinalStation ??= StationModel();

      if (lastFinalStation!.name != null &&
          !startStationList.any((e) => e.value == lastFinalStation!.name)) {
        startStationList.insert(
          lastFinalStation!.index!,
          DropdownMenuEntry(
            value: lastFinalStation!.name!,
            label: getStationName(lastFinalStation!.name!)!,
          ),
        );
      }

      lastFinalStation!.name = value;
      lastFinalStation!.index = startStationList.indexWhere(
        (e) => e.value == value,
      );

      startStationList.removeWhere((e) => e.value == value);

      if (context != null) {
        FocusScope.of(context).unfocus();
      }

      emit(TripDetailsChangesState());
    };
  }

  Future<Position> _getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw TripDetailsException(message: S.current.PleaseOpenLocation);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw TripDetailsException(
          message: S.current.LocationPermissionRequired,
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw TripDetailsException(message: S.current.LocationPermanentlyDenied);
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getNearestStation({bool userPressed = false}) async {
    emit(PositionLoadingState());

    final position = await _getPosition();

    nearestStation = _getNearestStationModel(
      position.latitude,
      position.longitude,
    )!;
    if (userPressed) {
      String? nearestStationName = nearestStation!.getStationName();
      startStationController.text = nearestStationName!;
      startStationsOnSelectedFunction()!(nearestStation!.name);
    }

    emit(PositionSuccessState());
  }

  StationModel? _getNearestStationModel(double latitude, double longitude) {
    var lowestDistance = 999999999.9;
    double distance;
    StationModel? station;
    for (var elemnet in [
      ...line1.stations,
      ...line2.stations,
      ...line3Branch1.stations,
      ...line3Branch2.stations,
      ...line3Main.stations,
    ]) {
      distance = Geolocator.distanceBetween(
        latitude,
        longitude,
        elemnet.latitude!,
        elemnet.longitudee!,
      );
      if (lowestDistance > distance) {
        lowestDistance = distance;
        station = elemnet;
      }
    }
    return station;
  }

  @override
  Future<void> close() {
    startStationController.dispose();
    finalStationController.dispose();
    return super.close();
  }
}
