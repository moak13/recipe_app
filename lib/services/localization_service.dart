import 'dart:ui';

import 'package:receipe_app/enums/languages.dart';

class LocalizationService {
  //Hold current app locale
  Locale _currentLocale = Locale.fromSubtags(languageCode: 'en');
  Locale get currentLocale => _currentLocale;

  //refactoring app-drawer VM localization
  Languages _selectedLocale = Languages.english;
  Languages get selectedLocale => _selectedLocale;

  //function to assign locale
  void assignLocale(Languages value) {
    _selectedLocale = value;
  }
}
