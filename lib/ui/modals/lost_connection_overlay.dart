import 'dart:ui';
import 'package:flutter/material.dart';


class LostConnectionOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Material(
        color: Colors.black.withOpacity(0.5),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: AlertDialog(
            title: Text('Connection Lost'),
            content: Text('Your device has lost connection to the server. Check internet connection'),
          ),
        ),
      ),
    );
  }
}
