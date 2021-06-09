import 'package:flutter/cupertino.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale get locale => _locale!;

  void setLocale(Locale locale) {}
}
