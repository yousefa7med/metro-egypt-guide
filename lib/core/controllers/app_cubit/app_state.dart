part of 'app_cubit.dart';

sealed class AppState {}

final class AppInitialState extends AppState {}

final class ThemeChangesState extends AppState {}

final class LocalizationChangesState extends AppState {}
