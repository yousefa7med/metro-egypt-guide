part of 'trip_cubit.dart';

sealed class TripState {}

final class TripInitialState extends TripState {}


final class PositionSuccessState extends TripState {
  final StationModel nearestStation;

  PositionSuccessState({required this.nearestStation});
}

final class PositionLoadingState extends TripState {}

final class PositionFailureState extends TripState {
  final String errMsg;

  PositionFailureState({required this.errMsg});
}

// final class AddToFavoutiteState extends TripState {}

// final class RemoveFromFavoutiteState extends TripState {}

// final class AllFavChangesState extends TripState {}
