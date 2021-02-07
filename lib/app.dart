import 'package:flutter/material.dart';
import 'package:flutterKit/views/root_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:overlay_support/overlay_support.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    Iterable<LocalizationsDelegate> _localizationsDelegates = [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      localizationDelegate,
    ];

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: OverlaySupport(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: initRoutes(context),
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: localizationDelegate.supportedLocales,
          locale: localizationDelegate.currentLocale,
        ),
      ),
    );
  }
}


Map<String, Widget Function(BuildContext)> initRoutes(BuildContext context) {
  return {
    '/' : (context) => RootPage(),
  };
}
