import 'package:flutter/material.dart';
import 'package:flutterKit/api/api.dart';
import 'package:flutter_translate/flutter_translate.dart';


class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}


class _RootPageState extends State<RootPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(translate('app_name'))),
      body: Container(),
    );
  }
}
