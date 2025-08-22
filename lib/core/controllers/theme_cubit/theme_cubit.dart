import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_egypt_guide/core/Helper/cashe_helper/cashe_helper.dart';
import 'package:metro_egypt_guide/core/Helper/cashe_helper/cashe_keys.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitialState()) {
    _loadTheme();
  }
  ThemeModeState currentTheme = ThemeModeState.system;
  static ThemeCubit get(BuildContext context) => BlocProvider.of(context);

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

  Future<void> saveTheme(ThemeModeState theme) async {
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
}

enum ThemeModeState { light, dark, system }
