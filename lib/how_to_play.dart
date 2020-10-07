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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
           Text(
             '1. Press the "place Your Bet" button.',
             style: TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.bold,
             ),
           ),
           SizedBox(height: 10),
           Center(
            child: Container(
               height: 100,
                child: Image(
                 image: AssetImage('assets/ss1.jpg'),
               ),
             ),
           ),
           Text(
             '2. Select the option that You think will be correct.',
             style: TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.bold,
             ),
           ),
           SizedBox(height: 10),
           Container(
             margin: EdgeInsets.all(10),
             height: 350,
              child: Image(
               image: AssetImage('assets/ss2.jpg'),
             ),
           ),
           SizedBox(height: 60),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(
                 "That's All",
                 style: TextStyle(
                   fontSize: 24.0,
                   fontWeight: FontWeight.bold
                 ),
                 ),
             ],
           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   "Try your Luck and Enjoy",
                   style: TextStyle(
                     fontSize: 24.0,
                     fontWeight: FontWeight.bold
                   ),
                   ),
                ], 
            ),  
       ],
      ),
    );
  }
}