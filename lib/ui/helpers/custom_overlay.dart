import 'package:flutter/material.dart';

class CustomOverlay {
  final Widget child;
  final BuildContext context;
  OverlayState state;
  OverlayEntry entry;
  bool showed = false;

  CustomOverlay({ @required this.context, @required this.child }) {
    state = Overlay.of(context);
    entry = OverlayEntry(builder: (context) => child);
  }

  void show() {
    print('Entry inserted');
    if (!showed) state.insert(entry);
    showed = true;
  }

  void hide() {
    if (!showed) return;
    if (entry != null) entry.remove();
    showed = false;
  }

}