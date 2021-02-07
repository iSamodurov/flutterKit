import 'dart:ui';

import 'package:flutter/material.dart';


class ExampleOverlay extends ModalRoute<void> {
  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  bool get barrierDismissible => false;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: Material(
        color: Colors.transparent,
        child: SafeArea(child: Container()),
      ),
    );
  }
}