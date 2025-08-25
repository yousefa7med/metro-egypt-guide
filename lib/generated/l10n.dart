// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Metro Guide`
  String get metroGuide {
    return Intl.message('Metro Guide', name: 'metroGuide', desc: '', args: []);
  }

  /// `Nearest Station`
  String get nearestStation {
    return Intl.message(
      'Nearest Station',
      name: 'nearestStation',
      desc: '',
      args: [],
    );
  }

  /// `Start Station`
  String get startStation {
    return Intl.message(
      'Start Station',
      name: 'startStation',
      desc: '',
      args: [],
    );
  }

  /// `Final Station`
  String get finalStation {
    return Intl.message(
      'Final Station',
      name: 'finalStation',
      desc: '',
      args: [],
    );
  }

  /// `Find Route`
  String get FindRoute {
    return Intl.message('Find Route', name: 'FindRoute', desc: '', args: []);
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `Settings`
  String get Settings {
    return Intl.message('Settings', name: 'Settings', desc: '', args: []);
  }

  /// `Lines`
  String get Lines {
    return Intl.message('Lines', name: 'Lines', desc: '', args: []);
  }

  /// `Select Metro Line`
  String get SelectMetroLine {
    return Intl.message(
      'Select Metro Line',
      name: 'SelectMetroLine',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Chooose A Metro Line' key

  /// `Line 1`
  String get Line1 {
    return Intl.message('Line 1', name: 'Line1', desc: '', args: []);
  }

  /// `Line 2`
  String get Line2 {
    return Intl.message('Line 2', name: 'Line2', desc: '', args: []);
  }

  /// `Line 3`
  String get Line3 {
    return Intl.message('Line 3', name: 'Line3', desc: '', args: []);
  }

  /// `Line Details`
  String get LineDetails {
    return Intl.message(
      'Line Details',
      name: 'LineDetails',
      desc: '',
      args: [],
    );
  }

  /// `All Lines`
  String get AllLines {
    return Intl.message('All Lines', name: 'AllLines', desc: '', args: []);
  }

  /// `Language`
  String get lang {
    return Intl.message('Language', name: 'lang', desc: '', args: []);
  }

  /// `Select your language`
  String get selectLang {
    return Intl.message(
      'Select your language',
      name: 'selectLang',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message('English', name: 'English', desc: '', args: []);
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message('Arabic', name: 'Arabic', desc: '', args: []);
  }

  /// `Choose your preferred theme`
  String get preTheme {
    return Intl.message(
      'Choose your preferred theme',
      name: 'preTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get Light {
    return Intl.message('Light', name: 'Light', desc: '', args: []);
  }

  /// `Dark`
  String get Dark {
    return Intl.message('Dark', name: 'Dark', desc: '', args: []);
  }

  /// `Theme`
  String get Theme {
    return Intl.message('Theme', name: 'Theme', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
