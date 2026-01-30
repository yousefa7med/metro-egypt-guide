import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_metro/core/Helper/metro_helper/metro_helper.dart';
import 'package:go_metro/core/Helper/metro_helper/models/line_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/Helper/mixins/station_name_mixin.dart';
import 'package:go_metro/core/errors/app_exeption.dart';
import 'package:go_metro/generated/l10n.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> with StationNameMixin {
  TripCubit({required this.metro}) : super(TripInitialState());

  Metro metro;

  static TripCubit get(context) => BlocProvider.of(context);

  final TextEditingController startStationController = TextEditingController();
  final TextEditingController finalStationController = TextEditingController();

  TripDetailsModel getTripDetails(String? start, String? end) {
    try {
      if (start == null || start.isEmpty || end == null || end.isEmpty) {
        throw Exception();
      }
      return metro.getTripDetails(start, end);
    } catch (e) {
      throw TripDetailsException(message: S.current.checkDetails);
    }
  }

  Future<Position> _getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(PositionFailureState(errMsg: S.current.PleaseOpenLocation));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(
          PositionFailureState(errMsg: S.current.LocationPermissionRequired),
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(PositionFailureState(errMsg: S.current.LocationPermanentlyDenied));
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getNearestStation() async {
    emit(PositionLoadingState());
    log('getNearestStation');
    final position = await _getPosition();

    final nearestStation = _getNearestStationModel(
      position.latitude,
      position.longitude,
    )!;
    String? nearestStationName = nearestStation.getStationName();
    startStationController.text = nearestStationName ?? '';

    emit(PositionSuccessState(nearestStation: nearestStation));
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
