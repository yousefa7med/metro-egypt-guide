import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_egypt_guide/core/Helper/cashe_helper/cashe_helper.dart';
import 'package:metro_egypt_guide/core/Helper/cashe_helper/cashe_keys.dart';
part 'theme_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState()) {
    _loadTheme();
    _loadLang();
  }
  ThemeModeState currentTheme = ThemeModeState.system;
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

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
    await CasheHelper().saveData(key: CasheKeys.theme, value: theme.name);
    emit(ThemeChangesState());
  }

  _loadTheme() {
    String savedTheme =
        CasheHelper().getData(CasheKeys.theme) as String? ?? "system";

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
    await CasheHelper().saveData(key: CasheKeys.lang, value: currentLang);
    emit(LocalizationChangesState());
  }

  void _loadLang() {
    String savedLang =
        CasheHelper().getData(CasheKeys.lang) as String? ??
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
