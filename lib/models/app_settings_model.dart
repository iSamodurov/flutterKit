import 'package:flutter/material.dart';


class AppSettingsModel with ChangeNotifier {

  // Application language
  String _language;
  String get language => _language;

  set language(String lang) {
    _language = lang;
    notifyListeners();
  }

}