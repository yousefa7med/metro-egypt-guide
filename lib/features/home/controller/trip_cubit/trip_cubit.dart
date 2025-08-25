import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_egypt_guide/core/Helper/metro_helper/metro_helper.dart';

part 'trip_state.dart';

class TripCubit extends Cubit<TripState> {
  TripCubit() : super(TripInitialState()) {
    _init();
  }
  Metro metro = Metro();
static  TripCubit get(context) => BlocProvider.of(context);
  final List<DropdownMenuEntry<String>> startStationList = [];
  final List<DropdownMenuEntry<String>> finalStationList = [];
  final TextEditingController startStationController = TextEditingController();
  final TextEditingController finalStationController = TextEditingController();
  void _init() {
    for (var station in allStation) {
      startStationList.add(DropdownMenuEntry(value: station, label: station));
      finalStationList.add(DropdownMenuEntry(value: station, label: station));
    }
  }

  void changeState() => emit(TripDetailsChangesState());
}
