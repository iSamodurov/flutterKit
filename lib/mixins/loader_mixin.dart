import 'package:flutter/material.dart';

mixin Loading<T extends StatefulWidget> on State<T> {
  bool loading = false;

  void setLoading(bool value) {
    if (mounted) {
      setState(() {
        loading = value;
      });
    }
  }

  Widget loader = Center(
    child: CircularProgressIndicator(),
  );
}
