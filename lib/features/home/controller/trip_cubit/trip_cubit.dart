import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';
import 'package:go_metro/core/Helper/cashe_helper/cache_helper.dart';
import 'package:go_metro/core/Helper/metro_helper/metro_helper.dart';
import 'package:go_metro/core/Helper/metro_helper/models/line_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/trip_details_model.dart';
import 'package:go_metro/core/Helper/mixins/station_name_mixin.dart';
import 'package:go_metro/core/errors/app_exeption.dart';
import 'package:go_metro/generated/l10n.dart';
import 'package:go_metro/objectbox.g.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> with StationNameMixin {
  TripCubit({required this.metro}) : super(TripInitialState()) {
    favourites = GetIt.instance<ObjectBoxServices>().detailsBox
        .getAll()
        .reversed
        .toList();

    for (var trip in favourites) {
      final routeQuery = GetIt.instance<ObjectBoxServices>().routeBox.query(
        RouteModel_.trip.equals(trip.id),
      )..order(RouteModel_.routeOrder);
      final routeQueryBuilder = routeQuery.build();
      trip.routes.clear();
      trip.routes.addAll(routeQueryBuilder.find());
      routeQueryBuilder.close();

      for (var route in trip.routes) {
        final stationQuery =
            GetIt.instance<ObjectBoxServices>().stationsBox.query(
              StationModel_.route.equals(route.id),
            )..order(StationModel_.order);
        final stationqueryBuilder = stationQuery.build();
        route.stations.clear();
        route.stations.addAll(stationqueryBuilder.find());
        stationqueryBuilder.close();
      }
    }
    emit(AllFavChangesState());
  }

  Metro metro;
  late final List<TripDetailsModel> favourites;

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
      throw LocationDisabledException();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // emit(
        //   PositionFailureState(errMsg: S.current.LocationPermissionRequired),

        // );
        throw LocationPermissionDeniedException();
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // emit(PositionFailureState(errMsg: S.current.LocationPermanentlyDenied));
      throw LocationPermissionPermanentlyDeniedException();
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getNearestStation() async {
    emit(PositionLoadingState());
    try {
      log('getNearestStation');
      final position = await _getPosition();

      final nearestStation = _getNearestStationModel(
        position.latitude,
        position.longitude,
      )!;
      String? nearestStationName = nearestStation.getStationName();
      startStationController.text = nearestStationName ?? '';

      emit(PositionSuccessState(nearestStation: nearestStation));
    } on LocationDisabledException {
      emit(PositionFailureState(errMsg: S.current.PleaseOpenLocation));
    } on LocationPermissionDeniedException {
      emit(PositionFailureState(errMsg: S.current.LocationPermissionRequired));
    } on LocationPermissionPermanentlyDeniedException {
      emit(PositionFailureState(errMsg: S.current.LocationPermanentlyDenied));
    }
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

  void removeFromFav(TripDetailsModel det) {
    favourites.remove(det);
    final box = GetIt.instance<ObjectBoxServices>().detailsBox;
    box.remove(det.id);
    det.isFav = false;
    emit(AllFavChangesState());
  }

  void addToFav(TripDetailsModel det) {
    det.isFav = true;

    favourites.insert(0, det);
    emit(AllFavChangesState());
    for (final route in det.routes) {
      route.trip.target = det; 
      for (final station in route.stations) {
        station.route.target = route; 
      }
    }

    GetIt.instance<ObjectBoxServices>().detailsBox.put(det);
  }

  @override
  Future<void> close() {
    startStationController.dispose();
    finalStationController.dispose();
    return super.close();
  }
}
