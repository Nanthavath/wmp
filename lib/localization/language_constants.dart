import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LAGUAGE_CODE = 'languageCode';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case 'us':
      return Locale('us', 'US');
    case 'lo':
      return Locale('lo', 'LO');
    default:
      return Locale('us', 'US');
  }
}
