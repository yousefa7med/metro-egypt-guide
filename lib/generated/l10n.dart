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

  /// `Station`
  String get station {
    return Intl.message('Station', name: 'station', desc: '', args: []);
  }

  /// `Enable Location`
  String get enableLocation {
    return Intl.message(
      'Enable Location',
      name: 'enableLocation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Open Settings`
  String get openSettings {
    return Intl.message(
      'Open Settings',
      name: 'openSettings',
      desc: '',
      args: [],
    );
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

  /// `Contact us`
  String get contactUs {
    return Intl.message('Contact us', name: 'contactUs', desc: '', args: []);
  }

  /// `Favourite Trips`
  String get favTrips {
    return Intl.message(
      'Favourite Trips',
      name: 'favTrips',
      desc: '',
      args: [],
    );
  }

  /// `Remove From Favourite`
  String get remfromFav {
    return Intl.message(
      'Remove From Favourite',
      name: 'remfromFav',
      desc: '',
      args: [],
    );
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

  /// `Transfer From`
  String get transferFrom {
    return Intl.message(
      'Transfer From',
      name: 'transferFrom',
      desc: '',
      args: [],
    );
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

  /// `See More`
  String get seeMore {
    return Intl.message('See More', name: 'seeMore', desc: '', args: []);
  }

  /// `See Less`
  String get seeLess {
    return Intl.message('See Less', name: 'seeLess', desc: '', args: []);
  }

  /// `Add Trips To Favourite`
  String get addTrips {
    return Intl.message(
      'Add Trips To Favourite',
      name: 'addTrips',
      desc: '',
      args: [],
    );
  }

  /// `is Transfer station between\nLine 1 and Line 2`
  String get transferBetween12 {
    return Intl.message(
      'is Transfer station between\nLine 1 and Line 2',
      name: 'transferBetween12',
      desc: '',
      args: [],
    );
  }

  /// `is Transfer station between\nLine 1 and Line 3`
  String get transferBetween13 {
    return Intl.message(
      'is Transfer station between\nLine 1 and Line 3',
      name: 'transferBetween13',
      desc: '',
      args: [],
    );
  }

  /// `is Transfer station between\nLine 2 and Line 3`
  String get transferBetween23 {
    return Intl.message(
      'is Transfer station between\nLine 2 and Line 3',
      name: 'transferBetween23',
      desc: '',
      args: [],
    );
  }

  /// `is Transfer station between\nimbaba branch and cairo Uni branch`
  String get transferBetween33 {
    return Intl.message(
      'is Transfer station between\nimbaba branch and cairo Uni branch',
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

  /// `El-Maasara`
  String get El_Maasara {
    return Intl.message('El-Maasara', name: 'El_Maasara', desc: '', args: []);
  }

  /// `Tora El-Asmant`
  String get Tora_El_Asmant {
    return Intl.message(
      'Tora El-Asmant',
      name: 'Tora_El_Asmant',
      desc: '',
      args: [],
    );
  }

  /// `Kozzika`
  String get Kozzika {
    return Intl.message('Kozzika', name: 'Kozzika', desc: '', args: []);
  }

  /// `Tora El-Balad`
  String get Tora_El_Balad {
    return Intl.message(
      'Tora El-Balad',
      name: 'Tora_El_Balad',
      desc: '',
      args: [],
    );
  }

  /// `Sakanat El-Maadi`
  String get Sakanat_El_Maadi {
    return Intl.message(
      'Sakanat El-Maadi',
      name: 'Sakanat_El_Maadi',
      desc: '',
      args: [],
    );
  }

  /// `El-Maadi`
  String get El_Maadi {
    return Intl.message('El-Maadi', name: 'El_Maadi', desc: '', args: []);
  }

  /// `Hadayek El-Maadi`
  String get Hadayek_El_Maadi {
    return Intl.message(
      'Hadayek El-Maadi',
      name: 'Hadayek_El_Maadi',
      desc: '',
      args: [],
    );
  }

  /// `Dar El-Salam`
  String get Dar_El_Salam {
    return Intl.message(
      'Dar El-Salam',
      name: 'Dar_El_Salam',
      desc: '',
      args: [],
    );
  }

  /// `El-Zahraa`
  String get El_Zahraa {
    return Intl.message('El-Zahraa', name: 'El_Zahraa', desc: '', args: []);
  }

  /// `Mar Girgis`
  String get Mar_Girgis {
    return Intl.message('Mar Girgis', name: 'Mar_Girgis', desc: '', args: []);
  }

  /// `El-Malek El-Saleh`
  String get El_Malek_El_saleh {
    return Intl.message(
      'El-Malek El-Saleh',
      name: 'El_Malek_El_saleh',
      desc: '',
      args: [],
    );
  }

  /// `El-Sayeda Zeinab`
  String get El_Sayeda_Zeinab {
    return Intl.message(
      'El-Sayeda Zeinab',
      name: 'El_Sayeda_Zeinab',
      desc: '',
      args: [],
    );
  }

  /// `Saad Zaghloul`
  String get Saad_Zaghloul {
    return Intl.message(
      'Saad Zaghloul',
      name: 'Saad_Zaghloul',
      desc: '',
      args: [],
    );
  }

  /// `El-Sadat`
  String get El_Sadat {
    return Intl.message('El-Sadat', name: 'El_Sadat', desc: '', args: []);
  }

  /// `Orabi`
  String get Orabi {
    return Intl.message('Orabi', name: 'Orabi', desc: '', args: []);
  }

  /// `El-Shohadaa`
  String get El_Shohadaa {
    return Intl.message('El-Shohadaa', name: 'El_Shohadaa', desc: '', args: []);
  }

  /// `Ghamra`
  String get Ghamra {
    return Intl.message('Ghamra', name: 'Ghamra', desc: '', args: []);
  }

  /// `El-Demerdash`
  String get El_Demerdash {
    return Intl.message(
      'El-Demerdash',
      name: 'El_Demerdash',
      desc: '',
      args: [],
    );
  }

  /// `Manshyet El-Sadr`
  String get Manshyet_El_Sadr {
    return Intl.message(
      'Manshyet El-Sadr',
      name: 'Manshyet_El_Sadr',
      desc: '',
      args: [],
    );
  }

  /// `Kobry El-Qubba`
  String get Kobry_El_Qubba {
    return Intl.message(
      'Kobry El-Qubba',
      name: 'Kobry_El_Qubba',
      desc: '',
      args: [],
    );
  }

  /// `Hammamet El-Qubba`
  String get Hammamet_El_Qubba {
    return Intl.message(
      'Hammamet El-Qubba',
      name: 'Hammamet_El_Qubba',
      desc: '',
      args: [],
    );
  }

  /// `Saray El-Qubba`
  String get Saray_El_Qubba {
    return Intl.message(
      'Saray El-Qubba',
      name: 'Saray_El_Qubba',
      desc: '',
      args: [],
    );
  }

  /// `Hadayek El-Zaytoun`
  String get Hadayek_El_Zaytoun {
    return Intl.message(
      'Hadayek El-Zaytoun',
      name: 'Hadayek_El_Zaytoun',
      desc: '',
      args: [],
    );
  }

  /// `Helmayet El-Zaytoun`
  String get Helmayet_El_Zaytoun {
    return Intl.message(
      'Helmayet El-Zaytoun',
      name: 'Helmayet_El_Zaytoun',
      desc: '',
      args: [],
    );
  }

  /// `El-Mattareya`
  String get El_Mattareya {
    return Intl.message(
      'El-Mattareya',
      name: 'El_Mattareya',
      desc: '',
      args: [],
    );
  }

  /// `Ain Shams`
  String get Ain_Shams {
    return Intl.message('Ain Shams', name: 'Ain_Shams', desc: '', args: []);
  }

  /// `Ezbet El-Nakhl`
  String get Ezbet_El_Nakhl {
    return Intl.message(
      'Ezbet El-Nakhl',
      name: 'Ezbet_El_Nakhl',
      desc: '',
      args: [],
    );
  }

  /// `Al-Marg`
  String get Al_Marg {
    return Intl.message('Al-Marg', name: 'Al_Marg', desc: '', args: []);
  }

  /// `New El-Marg`
  String get New_El_Marg {
    return Intl.message('New El-Marg', name: 'New_El_Marg', desc: '', args: []);
  }

  /// `Shubra El-Kheima`
  String get Shubra_El_Kheima {
    return Intl.message(
      'Shubra El-Kheima',
      name: 'Shubra_El_Kheima',
      desc: '',
      args: [],
    );
  }

  /// `Koleyet El-Zeraa`
  String get Koleyet_El_Zeraa {
    return Intl.message(
      'Koleyet El-Zeraa',
      name: 'Koleyet_El_Zeraa',
      desc: '',
      args: [],
    );
  }

  /// `El-Mezallat`
  String get El_Mezallat {
    return Intl.message('El-Mezallat', name: 'El_Mezallat', desc: '', args: []);
  }

  /// `El-Khalafawy`
  String get El_Khalafawy {
    return Intl.message(
      'El-Khalafawy',
      name: 'El_Khalafawy',
      desc: '',
      args: [],
    );
  }

  /// `Saint Theresa`
  String get Saint_Theresa {
    return Intl.message(
      'Saint Theresa',
      name: 'Saint_Theresa',
      desc: '',
      args: [],
    );
  }

  /// `Rod El-Farag`
  String get Rod_El_Farag {
    return Intl.message(
      'Rod El-Farag',
      name: 'Rod_El_Farag',
      desc: '',
      args: [],
    );
  }

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

  /// `El-Behoos`
  String get El_Behoos {
    return Intl.message('El-Behoos', name: 'El_Behoos', desc: '', args: []);
  }

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

  /// `Omm El-Masryeen`
  String get Omm_El_Masryeen {
    return Intl.message(
      'Omm El-Masryeen',
      name: 'Omm_El_Masryeen',
      desc: '',
      args: [],
    );
  }

  /// `Sakyet-Mekky`
  String get Sakyet_Mekky {
    return Intl.message(
      'Sakyet-Mekky',
      name: 'Sakyet_Mekky',
      desc: '',
      args: [],
    );
  }

  /// `El-Moneeb`
  String get El_Moneeb {
    return Intl.message('El-Moneeb', name: 'El_Moneeb', desc: '', args: []);
  }

  /// `Adly Mansour`
  String get Adly_Mansour {
    return Intl.message(
      'Adly Mansour',
      name: 'Adly_Mansour',
      desc: '',
      args: [],
    );
  }

  /// `El-Haikstep`
  String get El_Haikstep {
    return Intl.message('El-Haikstep', name: 'El_Haikstep', desc: '', args: []);
  }

  /// `Omar Ibn El-Khattab`
  String get Omar_Ibn_El_Khattab {
    return Intl.message(
      'Omar Ibn El-Khattab',
      name: 'Omar_Ibn_El_Khattab',
      desc: '',
      args: [],
    );
  }

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

  /// `El-Shams Club`
  String get El_Shams_Club {
    return Intl.message(
      'El-Shams Club',
      name: 'El_Shams_Club',
      desc: '',
      args: [],
    );
  }

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

  /// `El-Ahram`
  String get El_Ahram {
    return Intl.message('El-Ahram', name: 'El_Ahram', desc: '', args: []);
  }

  /// `Kolleyet El-Banat`
  String get Kolleyet_El_Banat {
    return Intl.message(
      'Kolleyet El-Banat',
      name: 'Kolleyet_El_Banat',
      desc: '',
      args: [],
    );
  }

  /// `Stadium`
  String get Stadium {
    return Intl.message('Stadium', name: 'Stadium', desc: '', args: []);
  }

  /// `Fair Zone`
  String get Fair_Zone {
    return Intl.message('Fair Zone', name: 'Fair_Zone', desc: '', args: []);
  }

  /// `El-Abassiya`
  String get El_Abassiya {
    return Intl.message('El-Abassiya', name: 'El_Abassiya', desc: '', args: []);
  }

  /// `Abdou Pasha`
  String get Abdou_Pasha {
    return Intl.message('Abdou Pasha', name: 'Abdou_Pasha', desc: '', args: []);
  }

  /// `El-Geish`
  String get El_Geish {
    return Intl.message('El-Geish', name: 'El_Geish', desc: '', args: []);
  }

  /// `Bab El-Shaariya`
  String get Bab_El_Shaariya {
    return Intl.message(
      'Bab El-Shaariya',
      name: 'Bab_El_Shaariya',
      desc: '',
      args: [],
    );
  }

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

  /// `Kit-Kat`
  String get Kit_Kat {
    return Intl.message('Kit-Kat', name: 'Kit_Kat', desc: '', args: []);
  }

  /// `Sudan`
  String get Sudan {
    return Intl.message('Sudan', name: 'Sudan', desc: '', args: []);
  }

  /// `Imbaba`
  String get Imbaba {
    return Intl.message('Imbaba', name: 'Imbaba', desc: '', args: []);
  }

  /// `El-Bohy`
  String get El_Bohy {
    return Intl.message('El-Bohy', name: 'El_Bohy', desc: '', args: []);
  }

  /// `El-Qawmia`
  String get El_Qawmia {
    return Intl.message('El-Qawmia', name: 'El_Qawmia', desc: '', args: []);
  }

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

  /// `Wadi El-Nile`
  String get Wadi_El_Nile {
    return Intl.message(
      'Wadi El-Nile',
      name: 'Wadi_El_Nile',
      desc: '',
      args: [],
    );
  }

  /// `Gamet El-Dowel`
  String get Gamet_El_Dowel {
    return Intl.message(
      'Gamet El-Dowel',
      name: 'Gamet_El_Dowel',
      desc: '',
      args: [],
    );
  }

  /// `Boulak El-Dakrour`
  String get Boulak_El_Dakrour {
    return Intl.message(
      'Boulak El-Dakrour',
      name: 'Boulak_El_Dakrour',
      desc: '',
      args: [],
    );
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
