part of 'trip_cubit.dart';

sealed class TripState {}

final class TripInitialState extends TripState {}

final class TripDetailsChangesState extends TripState {}


final class PositionSuccessState extends TripState {}

final class PositionLoadingState extends TripState {}

final class AddToFavoutiteState extends TripState {}

final class RemoveFromFavoutiteState extends TripState {}

final class AllFavChangesState extends TripState {}
