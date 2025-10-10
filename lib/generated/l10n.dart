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

  /// `Please Open Location`
  String get PleaseOpenLocation {
    return Intl.message(
      'Please Open Location',
      name: 'PleaseOpenLocation',
      desc: '',
      args: [],
    );
  }

  /// `Location permission required`
  String get LocationPermissionRequired {
    return Intl.message(
      'Location permission required',
      name: 'LocationPermissionRequired',
      desc: '',
      args: [],
    );
  }

  /// `'Location permissions are permanently denied, we cannot request permissions.'`
  String get LocationPermanentlyDenied {
    return Intl.message(
      '\'Location permissions are permanently denied, we cannot request permissions.\'',
      name: 'LocationPermanentlyDenied',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait`
  String get pleaseWait {
    return Intl.message('Please Wait', name: 'pleaseWait', desc: '', args: []);
  }

  /// `Please check your start station and final station`
  String get checkDetails {
    return Intl.message(
      'Please check your start station and final station',
      name: 'checkDetails',
      desc: '',
      args: [],
    );
  }

  /// `Route Details`
  String get routeDetails {
    return Intl.message(
      'Route Details',
      name: 'routeDetails',
      desc: '',
      args: [],
    );
  }

  /// `Trip Information`
  String get tripInfo {
    return Intl.message(
      'Trip Information',
      name: 'tripInfo',
      desc: '',
      args: [],
    );
  }

  /// `EGY`
  String get EGY {
    return Intl.message('EGY', name: 'EGY', desc: '', args: []);
  }

  /// `min`
  String get min {
    return Intl.message('min', name: 'min', desc: '', args: []);
  }

  /// `Transfer`
  String get Transfer {
    return Intl.message('Transfer', name: 'Transfer', desc: '', args: []);
  }

  /// `Back To Home`
  String get backToHome {
    return Intl.message('Back To Home', name: 'backToHome', desc: '', args: []);
  }

  /// `Add To Favourite`
  String get addToFav {
    return Intl.message(
      'Add To Favourite',
      name: 'addToFav',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message('From', name: 'from', desc: '', args: []);
  }

  /// `To`
  String get to {
    return Intl.message('To', name: 'to', desc: '', args: []);
  }

  /// `is Transfer station between Line 1 and Line 2`
  String get transferBetween12 {
    return Intl.message(
      'is Transfer station between Line 1 and Line 2',
      name: 'transferBetween12',
      desc: '',
      args: [],
    );
  }

  /// `is Transfer station between Line 1 and Line 3`
  String get transferBetween13 {
    return Intl.message(
      'is Transfer station between Line 1 and Line 3',
      name: 'transferBetween13',
      desc: '',
      args: [],
    );
  }

  /// `is Transfer station between Line 2 and Line 3`
  String get transferBetween23 {
    return Intl.message(
      'is Transfer station between Line 2 and Line 3',
      name: 'transferBetween23',
      desc: '',
      args: [],
    );
  }

  /// `is Transfer station between imbaba branch and cairo Uni branch`
  String get transferBetween33 {
    return Intl.message(
      'is Transfer station between imbaba branch and cairo Uni branch',
      name: 'transferBetween33',
      desc: '',
      args: [],
    );
  }

  /// `Helwan`
  String get Helwan {
    return Intl.message('Helwan', name: 'Helwan', desc: '', args: []);
  }

  /// `Helwan University`
  String get Helwan_University {
    return Intl.message(
      'Helwan University',
      name: 'Helwan_University',
      desc: '',
      args: [],
    );
  }

  /// `Ain Helwan`
  String get Ain_Helwan {
    return Intl.message('Ain Helwan', name: 'Ain_Helwan', desc: '', args: []);
  }

  /// `Wadi Hof`
  String get Wadi_Hof {
    return Intl.message('Wadi Hof', name: 'Wadi_Hof', desc: '', args: []);
  }

  /// `Hadayek Helwan`
  String get Hadayek_Helwan {
    return Intl.message(
      'Hadayek Helwan',
      name: 'Hadayek_Helwan',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'El-Maasara' key

  // skipped getter for the 'Tora_El-Asmant' key

  /// `Kozzika`
  String get Kozzika {
    return Intl.message('Kozzika', name: 'Kozzika', desc: '', args: []);
  }

  // skipped getter for the 'Tora_El-Balad' key

  // skipped getter for the 'Sakanat_El-Maadi' key

  // skipped getter for the 'El-Maadi' key

  // skipped getter for the 'Hadayek_El-Maadi' key

  // skipped getter for the 'Dar_El-Salam' key

  // skipped getter for the 'El-Zahraa' key

  /// `Mar Girgis`
  String get Mar_Girgis {
    return Intl.message('Mar Girgis', name: 'Mar_Girgis', desc: '', args: []);
  }

  // skipped getter for the 'El-Malek_El-Saleh' key

  // skipped getter for the 'El-Sayeda_Zeinab' key

  /// `Saad Zaghloul`
  String get Saad_Zaghloul {
    return Intl.message(
      'Saad Zaghloul',
      name: 'Saad_Zaghloul',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'El-Sadat' key

  /// `Orabi`
  String get Orabi {
    return Intl.message('Orabi', name: 'Orabi', desc: '', args: []);
  }

  // skipped getter for the 'El-Shohadaa' key

  /// `Ghamra`
  String get Ghamra {
    return Intl.message('Ghamra', name: 'Ghamra', desc: '', args: []);
  }

  // skipped getter for the 'El-Demerdash' key

  // skipped getter for the 'Manshyet_El-Sadr' key

  // skipped getter for the 'Kobry_El-Qubba' key

  // skipped getter for the 'Hammamet_El-Qubba' key

  // skipped getter for the 'Saray_El-Qubba' key

  // skipped getter for the 'Hadayek_El-Zaytoun' key

  // skipped getter for the 'Helmayet_El-Zaytoun' key

  // skipped getter for the 'El-Mattareya' key

  /// `Ain Shams`
  String get Ain_Shams {
    return Intl.message('Ain Shams', name: 'Ain_Shams', desc: '', args: []);
  }

  // skipped getter for the 'Ezbet_El-Nakhl' key

  // skipped getter for the 'Al-Marg' key

  // skipped getter for the 'New_El-Marg' key

  // skipped getter for the 'Shubra_El-Kheima' key

  // skipped getter for the 'Koleyet_El-Zeraa' key

  // skipped getter for the 'El-Mezallat' key

  // skipped getter for the 'El-Khalafawy' key

  /// `Saint Theresa`
  String get Saint_Theresa {
    return Intl.message(
      'Saint Theresa',
      name: 'Saint_Theresa',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Rod_El-Farag' key

  /// `Massara`
  String get Massara {
    return Intl.message('Massara', name: 'Massara', desc: '', args: []);
  }

  /// `Nageeb`
  String get Nageeb {
    return Intl.message('Nageeb', name: 'Nageeb', desc: '', args: []);
  }

  /// `Opera`
  String get Opera {
    return Intl.message('Opera', name: 'Opera', desc: '', args: []);
  }

  /// `Dokki`
  String get Dokki {
    return Intl.message('Dokki', name: 'Dokki', desc: '', args: []);
  }

  // skipped getter for the 'El-Behoos' key

  /// `Cairo University`
  String get Cairo_University {
    return Intl.message(
      'Cairo University',
      name: 'Cairo_University',
      desc: '',
      args: [],
    );
  }

  /// `Faysal`
  String get Faysal {
    return Intl.message('Faysal', name: 'Faysal', desc: '', args: []);
  }

  /// `Giza`
  String get Giza {
    return Intl.message('Giza', name: 'Giza', desc: '', args: []);
  }

  // skipped getter for the 'Omm_El-Masryeen' key

  // skipped getter for the 'Sakyet-Mekky' key

  // skipped getter for the 'El-Moneeb' key

  /// `Adly Mansour`
  String get Adly_Mansour {
    return Intl.message(
      'Adly Mansour',
      name: 'Adly_Mansour',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'El-Haikstep' key

  // skipped getter for the 'Omar_Ibn El-Khattab' key

  /// `Qebaa`
  String get Qebaa {
    return Intl.message('Qebaa', name: 'Qebaa', desc: '', args: []);
  }

  /// `Hesham Barakat`
  String get Hesham_Barakat {
    return Intl.message(
      'Hesham Barakat',
      name: 'Hesham_Barakat',
      desc: '',
      args: [],
    );
  }

  /// `Nozha`
  String get Nozha {
    return Intl.message('Nozha', name: 'Nozha', desc: '', args: []);
  }

  // skipped getter for the 'El-Shams_Club' key

  /// `Alf Masken`
  String get Alf_Masken {
    return Intl.message('Alf Masken', name: 'Alf_Masken', desc: '', args: []);
  }

  /// `Heliopolis`
  String get Heliopolis {
    return Intl.message('Heliopolis', name: 'Heliopolis', desc: '', args: []);
  }

  /// `Haroun`
  String get Haroun {
    return Intl.message('Haroun', name: 'Haroun', desc: '', args: []);
  }

  // skipped getter for the 'El-Ahram' key

  // skipped getter for the 'Kolleyet_El-Banat' key

  /// `Stadium`
  String get Stadium {
    return Intl.message('Stadium', name: 'Stadium', desc: '', args: []);
  }

  /// `Fair Zone`
  String get Fair_Zone {
    return Intl.message('Fair Zone', name: 'Fair_Zone', desc: '', args: []);
  }

  // skipped getter for the 'El-Abassiya' key

  /// `Abdou Pasha`
  String get Abdou_Pasha {
    return Intl.message('Abdou Pasha', name: 'Abdou_Pasha', desc: '', args: []);
  }

  // skipped getter for the 'El-Geish' key

  // skipped getter for the 'Bab_El-Shaariya' key

  /// `Attaba`
  String get Attaba {
    return Intl.message('Attaba', name: 'Attaba', desc: '', args: []);
  }

  /// `Nasser`
  String get Nasser {
    return Intl.message('Nasser', name: 'Nasser', desc: '', args: []);
  }

  /// `Maspero`
  String get Maspero {
    return Intl.message('Maspero', name: 'Maspero', desc: '', args: []);
  }

  /// `Safaa Hegazy`
  String get Safaa_Hegazy {
    return Intl.message(
      'Safaa Hegazy',
      name: 'Safaa_Hegazy',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Kit-Kat' key

  /// `Sudan`
  String get Sudan {
    return Intl.message('Sudan', name: 'Sudan', desc: '', args: []);
  }

  /// `Imbaba`
  String get Imbaba {
    return Intl.message('Imbaba', name: 'Imbaba', desc: '', args: []);
  }

  // skipped getter for the 'El-Bohy' key

  // skipped getter for the 'El-Qawmia' key

  /// `Ring Road`
  String get Ring_Road {
    return Intl.message('Ring Road', name: 'Ring_Road', desc: '', args: []);
  }

  /// `Rod El Farag Corr`
  String get Rod_El_Farag_Corr {
    return Intl.message(
      'Rod El Farag Corr',
      name: 'Rod_El_Farag_Corr',
      desc: '',
      args: [],
    );
  }

  /// `Tawfikia`
  String get Tawfikia {
    return Intl.message('Tawfikia', name: 'Tawfikia', desc: '', args: []);
  }

  // skipped getter for the 'Wadi_El-Nile' key

  // skipped getter for the 'Gamet_El-Dowel' key

  // skipped getter for the 'Boulak_El-Dakrour' key
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
