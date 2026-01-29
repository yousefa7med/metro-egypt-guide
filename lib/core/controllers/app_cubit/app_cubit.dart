import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_metro/core/Helper/cashe_helper/cache_helper.dart';
import 'package:go_metro/core/Helper/cashe_helper/cache_keys.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  ExpansibleController lineController1 = ExpansibleController();
  ExpansibleController lineController2 = ExpansibleController();
  ExpansibleController lineController3 = ExpansibleController();
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
   GetIt.instance<CacheHelper>().saveData(key: CacheKeys.theme, value: theme.name);
    emit(ThemeChangesState());
  }

  void init() {
    _loadTheme();
    _loadLang();
  }

  void _loadTheme() {
    String savedTheme =
      GetIt.instance<CacheHelper>().getData(CacheKeys.theme) as String? ?? "system";

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
    await GetIt.instance<CacheHelper>().saveData(key: CacheKeys.lang, value: currentLang);
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

  @override
  Future<void> close() {
    lineController1.dispose();
    lineController2.dispose();
    lineController3.dispose();
    return super.close();
  }
}

enum ThemeModeState { light, dark, system }
