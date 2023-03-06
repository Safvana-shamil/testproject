import 'package:flutter/material.dart';

class LanguageViewModel with ChangeNotifier {
  Locale _currentLocale =  Locale('en', 'EN');

  Locale get currentLocale => _currentLocale;

  void changeLocale(Locale newLocale) {
    _currentLocale = newLocale;
    notifyListeners();
  }
}
