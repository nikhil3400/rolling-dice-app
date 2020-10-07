import 'package:flutter/material.dart';
import 'package:rolling_dice/button.dart';
import 'package:rolling_dice/homescreen.dart';
import 'package:rolling_dice/how_to_play.dart';
import 'dart:io';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Rolling Dice',
          style: TextStyle(
            fontSize: 22.0,
            letterSpacing: 2.0,
          ),
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/rolling.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 200),
              Button(
                name: 'Start',
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen() ));
                },
              ),
              SizedBox(height: 20.0),
              Button(
                name: 'How to Play',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HowToPlay() ));
                },
              ),
              SizedBox(height: 20.0),
              Button(
                name: 'Quit',
                onPressed: (){
                  exit(0);
                },
              ),
             SizedBox(height: 350),
             Text(
               'Version 1.0v',
               style: TextStyle(
                 letterSpacing: 2.0,
                 color: Colors.white,
               ),
             ),
            ],
          ),
        ),
      ),

    );
  }
}