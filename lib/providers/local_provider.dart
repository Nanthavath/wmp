import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String LOCALE_PRE = "";

class LocaleProvider extends ChangeNotifier {
  Locale _currentLocale = Locale('en');

  Locale get currentLocale => _currentLocale;

  void changeLocale(String _locale) async {
    this.._currentLocale = Locale(_locale);
    notifyListeners();
  }
}
