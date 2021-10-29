import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String languagecode = 'languageCode';

//languages code
const String english = 'en';
const String espanol = 'es';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(languagecode, languageCode);
  print(languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(languagecode) ?? "es";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return Locale(english, 'US');
    case espanol:
      return Locale(espanol, "CO");
    default:
      return Locale(espanol, 'CO');
  }
}
