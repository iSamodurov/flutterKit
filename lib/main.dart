import 'package:flutter/material.dart';
import 'package:flutterKit/models/app_settings_model.dart';
import 'package:flutterKit/services/translate_preferences.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'config.dart';

void main() async {

  var delegate = await LocalizationDelegate.create(
    fallbackLocale: config['FALLBACK_LOCALE'],
    supportedLocales: config['SUPPORTED_LOCALES'],
    preferences: TranslatePreferences(),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettingsModel()),
      ],
      child: LocalizedApp(delegate, App()),
    ),
  );
}
