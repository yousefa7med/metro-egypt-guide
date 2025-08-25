import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/metro_helper.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/models/station_model.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit() : super(TripInitialState()) {
    _init();
  }
  Metro metro = Metro();
  static TripCubit get(context) => BlocProvider.of(context);
  final List<DropdownMenuEntry<String>> startStationList = [];
  final List<DropdownMenuEntry<String>> finalStationList = [];
  final TextEditingController startStationController = TextEditingController();
  final TextEditingController finalStationController = TextEditingController();
  StationModel? lastStartStation;
  StationModel? lastFinalStation;
  void _init() {
    for (var station in allStation) {
      startStationList.add(DropdownMenuEntry(value: station, label: station));
      finalStationList.add(DropdownMenuEntry(value: station, label: station));
    }
  }

  void changeState() => emit(TripDetailsChangesState());

  Function(dynamic)? startStationsOnSelectedFunction(BuildContext context) {
    return (value) {
      value = TripCubit.get(context).startStationController.text;
      TripCubit.get(context).lastStartStation ??= StationModel();

      if (TripCubit.get(context).lastStartStation!.name != null &&
          !TripCubit.get(context).finalStationList.any(
            (e) => e.value == TripCubit.get(context).lastStartStation!.name,
          )) {
        TripCubit.get(context).finalStationList.insert(
          TripCubit.get(context).lastStartStation!.index!,
          DropdownMenuEntry(
            value: TripCubit.get(context).lastStartStation!.name!,
            label: TripCubit.get(context).lastStartStation!.name!,
          ),
        );
      }

      TripCubit.get(context).lastStartStation!.name = value;
      TripCubit.get(context).lastStartStation!.index = TripCubit.get(
        context,
      ).finalStationList.indexWhere((e) => e.value == value);

      TripCubit.get(
        context,
      ).finalStationList.removeWhere((e) => e.value == value);

      emit(TripDetailsChangesState());
    };
  }

  Function(dynamic)? finalStationsOnSelectedFunction(BuildContext context) {
    return (value) {
      value = TripCubit.get(context).finalStationController.text;
      TripCubit.get(context).lastFinalStation ??= StationModel();

      if (TripCubit.get(context).lastFinalStation!.name != null &&
          !TripCubit.get(context).startStationList.any(
            (e) => e.value == TripCubit.get(context).lastFinalStation!.name,
          )) {
        TripCubit.get(context).startStationList.insert(
          TripCubit.get(context).lastFinalStation!.index!,
          DropdownMenuEntry(
            value: TripCubit.get(context).lastFinalStation!.name!,
            label: TripCubit.get(context).lastFinalStation!.name!,
          ),
        );
      }

      TripCubit.get(context).lastFinalStation!.name = value;
      TripCubit.get(context).lastFinalStation!.index = TripCubit.get(
        context,
      ).startStationList.indexWhere((e) => e.value == value);

      TripCubit.get(
        context,
      ).startStationList.removeWhere((e) => e.value == value);
      emit(TripDetailsChangesState());
    };
  }
}
