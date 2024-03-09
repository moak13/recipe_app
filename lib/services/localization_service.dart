import 'dart:ui';

import 'package:receipe_app/enums/languages.dart';

class LocalizationService {
  //Locale.fromSubtags(languageCode: 'en'),

  //Hold current app locale
  Locale _currentLocale = Locale.fromSubtags(languageCode: 'en');
  Locale get currentLocale => _currentLocale;

  //refactoring app-drawer VM localization
  Languages _selectedLanguage = Languages.english;
  Languages get selectedLanguage => _selectedLanguage;

  //function to assign locale
  void assignLocale(Languages value) {
    _selectedLanguage = value;
  }
}
