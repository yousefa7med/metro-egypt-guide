import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_metro/core/Helper/cashe_helper/cache_helper.dart';
import 'package:go_metro/core/Helper/cashe_helper/cache_keys.dart';
import 'package:go_metro/core/Helper/metro_helper/models/line_model.dart';
import 'package:go_metro/core/Helper/metro_helper/models/station_model.dart';
import 'package:go_metro/core/utilities/assets.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  ThemeModeState currentTheme = ThemeModeState.system;
  static AppCubit get(BuildContext context) => BlocProvider.of(context);
  Future<void> init() async {
    _loadTheme();
    _loadLang();
    await assignLines();
  }

  Future<Map<String, dynamic>> _loadLines() async {
    final response = await rootBundle.loadString(Assets.linesJson);
    return jsonDecode(response);
  }

  Future<void> assignLines() async {
    final json = await _loadLines();
    line1 = LineModel.fromJson(json: json, linekey: "line1");
    line2 = LineModel.fromJson(json: json, linekey: "line2");
    line3Main = LineModel.fromJson(json: json, linekey: "line3Main");
    line3Branch1 = LineModel.fromJson(json: json, linekey: "line3Branch1");
    line3Branch2 = LineModel.fromJson(json: json, linekey: "line3Branch2");
    commonStations = (json["commonStations"] as List)
        .map((e) => StationModel.fromJson(json: e))
        .toList();
  }

  ThemeMode getTheme() {
    switch (currentTheme) {
      case ThemeModeState.light:
        return ThemeMode.light;
      case ThemeModeState.dark:
        return ThemeMode.dark;

      default:
        return ThemeMode.system;
    }
  }

  Future<void> setTheme(ThemeModeState theme) async {
    currentTheme = theme;
    GetIt.instance<CacheHelper>().saveData(
      key: CacheKeys.theme,
      value: theme.name,
    );
    emit(ThemeChangesState());
  }

  void _loadTheme() {
    String savedTheme =
        GetIt.instance<CacheHelper>().getData(CacheKeys.theme) as String? ??
        "system";

    currentTheme = ThemeModeState.values.firstWhere(
      (e) => e.name == savedTheme,
      orElse: () => ThemeModeState.system,
    );
    emit(ThemeChangesState());
  }

  // <============================= Localization ==================================>
  String currentLang = '';

  Future<void> setLang(String lang) async {
    currentLang = lang;
    await GetIt.instance<CacheHelper>().saveData(
      key: CacheKeys.lang,
      value: currentLang,
    );
    emit(LocalizationChangesState());
  }

  void _loadLang() {
    String savedLang =
        GetIt.instance<CacheHelper>().getData(CacheKeys.lang) as String? ??
        PlatformDispatcher.instance.locale.languageCode;

    switch (savedLang) {
      case 'ar':
        {
          currentLang = savedLang;
        }

      default:
        {
          currentLang = 'en';
        }
    }
    emit(LocalizationChangesState());
  }

  String getLang() {
    switch (currentLang) {
      case 'ar':
        return 'ar';

      default:
        {
          return 'en';
        }
    }
  }
}

enum ThemeModeState { light, dark, system }
