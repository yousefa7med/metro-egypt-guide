import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_metro/core/Helper/functions/functions.dart';
import 'package:go_metro/core/Helper/metro_helper/metro_helper.dart';
import 'package:go_metro/core/Helper/metro_helper/models/line_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/Helper/mixins/station_name_mixin.dart';
import 'package:go_metro/core/errors/app_exeption.dart';
import 'package:go_metro/generated/l10n.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> with StationNameMixin {
  TripCubit() : super(TripInitialState());

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
        localStation = stationName(station)!;

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
            label: stationName(lastStartStation!.name!)!,
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
            label: stationName(lastFinalStation!.name!)!,
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

  // void allFavChanges() {
  //   allFav = !allFav;
  //   emit(AllFavChangesState());
  // }

  // void removeFromFav(TripDetailsModel det) {
  //   // ObjectBox().detailsBox.remove(det.id);
  //   // favList.remove(det);
  //   isFav = false;
  //   emit(RemoveFromFavoutiteState());
  // }

  // void addToFav(TripDetailsModel det) {
  //   // ObjectBox().detailsBox.put(det);
  //   isFav = true;
  //   emit(AddToFavoutiteState());
  // }

  @override
  Future<void> close() {
    startStationController.dispose();
    finalStationController.dispose();
    return super.close();
  }
}
