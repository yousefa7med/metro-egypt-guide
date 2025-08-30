import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:metro_egypt_guide/core/Helper/functions/app_dialog.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/metro_helper.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/station_model.dart';
import 'package:metro_egypt_guide/core/navigations/navigations.dart';
import 'package:metro_egypt_guide/generated/l10n.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit() : super(TripInitialState()) {
    _init();
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
  void _init() {
    for (var station in allStations) {
      startStationList.add(DropdownMenuEntry(value: station, label: station));
      finalStationList.add(DropdownMenuEntry(value: station, label: station));
    }
  }

  Function(dynamic)? startStationsOnSelectedFunction() {
    return (value) {
      value = startStationController.text;
      lastStartStation ??= StationModel();

      if (lastStartStation!.name != null &&
          !finalStationList.any((e) => e.value == lastStartStation!.name)) {
        finalStationList.insert(
          lastStartStation!.index!,
          DropdownMenuEntry(
            value: lastStartStation!.name!,
            label: lastStartStation!.name!,
          ),
        );
      }

      lastStartStation!.name = value;
      lastStartStation!.index = finalStationList.indexWhere(
        (e) => e.value == value,
      );

      finalStationList.removeWhere((e) => e.value == value);

      emit(TripDetailsChangesState());
    };
  }

  Function(dynamic)? finalStationsOnSelectedFunction() {
    return (value) {
      value = finalStationController.text;
      lastFinalStation ??= StationModel();

      if (lastFinalStation!.name != null &&
          !startStationList.any((e) => e.value == lastFinalStation!.name)) {
        startStationList.insert(
          lastFinalStation!.index!,
          DropdownMenuEntry(
            value: lastFinalStation!.name!,
            label: lastFinalStation!.name!,
          ),
        );
      }

      lastFinalStation!.name = value;
      lastFinalStation!.index = startStationList.indexWhere(
        (e) => e.value == value,
      );

      startStationList.removeWhere((e) => e.value == value);
      emit(TripDetailsChangesState());
    };
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('!serviceEnabled');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('permission == LocationPermission.denied');

        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print('permission == LocationPermission.deniedForever');

      return null;
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _initPosition() async {
    position = await _determinePosition();
    emit(PositionExistState());
  }

  Future<Either<Position, String>> _getPosition(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;
    final s = S.of(context);
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Right(s.PleaseOpenLocation);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Right(s.LocationPermissionRequired);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Right(s.LocationPermanentlyDenied);
    }

    return Left(await Geolocator.getCurrentPosition());
  }

  Future<void> getNearestStation(BuildContext context) async {
    final result = await _getPosition(context);
    result.fold(
      (p) {
        position = p;
        nearestStation = getNearestStationModel(
          position!.latitude,
          position!.longitude,
        )!;

        startStationController.text = nearestStation!.name!;
        startStationsOnSelectedFunction()!(nearestStation!.name!);
        emit(PositionExistState());
      },
      (msg) {
        appDialog(
          context: context,
          msg: msg,
          onPressed: () async {
            if (S.of(context).LocationPermissionRequired == msg) {
              await Geolocator.requestPermission();
            } else if (S.of(context).PleaseOpenLocation == msg) {
              AppNavigation.pop(context: context);
              await Geolocator.openLocationSettings();
            } else if (S.of(context).LocationPermanentlyDenied == msg) {
              await Geolocator.openAppSettings();
            }
          },
        );
      },
    );
  }

  StationModel? getNearestStationModel(double latitude, double longitude) {
    var lowestDistance = 999999999.9;
    double distance;
    StationModel? station;
    for (var elemnet in [
      ...line1,
      ...line2,
      ...line3Branch1,
      ...line3Branch2,
      ...line3Main,
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
