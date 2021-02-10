import 'dart:ui';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TranslatePreferences implements ITranslatePreferences {

  static const String APP_LOCALE_KEY = 'app_locale';

  @override
  Future<Locale> getPreferredLocale() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(APP_LOCALE_KEY)) return null;
    String locale = prefs.getString(APP_LOCALE_KEY);
    return localeFromString(locale);
  }

  @override
  Future<bool> savePreferredLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(APP_LOCALE_KEY, localeToString(locale));
  }

}