part of 'trip_cubit.dart';

sealed class TripState {}

final class TripInitialState extends TripState {}

final class TripDetailsChangesState extends TripState {}
