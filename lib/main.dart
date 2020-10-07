import 'package:flutter/material.dart';
//import 'package:rolling_dice/homescreen.dart';
import 'package:rolling_dice/startscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(),
    );
  }
}