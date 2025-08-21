import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metro_egypt_guide/core/Helper/cashe_helper/cashe_helper.dart';
import 'package:metro_egypt_guide/core/Helper/cashe_helper/cashe_keys.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial()) {
    _loadLang();
  }

  String currentLang = '';

static  LocalizationCubit get(BuildContext context) => BlocProvider.of(context);

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
