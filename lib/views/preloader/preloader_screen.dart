import 'package:flutter/material.dart';

class PreloaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Please wait'),
              SizedBox(height: 20),
              LinearProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
