import 'package:flutter/material.dart';

class HowToPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: Text(
          'How To Play',
          style: TextStyle(
            fontSize: 22.0,
            letterSpacing: 2.0,
          ),
        ),
      ),

      body: Column(
        children: [
        //   Text(
        //     "1. Press the 'place a bet' button.",
        //     style: TextStyle(
        //       fontSize: 24,
        //       letterSpacing: 2.0,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        Text('how to Play page.'),
        Text('TODO: Write "How to play" instructions.'),
        ],
      ),
    );
  }
}