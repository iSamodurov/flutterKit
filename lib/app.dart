import 'package:flutter/material.dart';
import 'package:flutterKit/views/root_page.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: initRoutes(context),
    );
  }
}


Map<String, Widget Function(BuildContext)> initRoutes(BuildContext context) {
  return {
    '/' : (context) => RootPage(),
  };
}
