import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';


class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(translate('app_name'))),
      body: Container(),
    );
  }
}
