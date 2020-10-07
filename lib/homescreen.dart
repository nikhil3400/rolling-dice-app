import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rolling_dice/alertbox.dart';
import 'package:rolling_dice/quit_alert.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  int _diceVal1 = 1;
  int _diceVal2 = 2;
  AnimationController _controller;
  var animation;
  AlertBox obj;
  int flag=0;
  bool val;
  QuitAlert quit = new QuitAlert();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void changeValue() {
    setState(() {
      _controller.forward();   
    });
  }

  void animate() {
    _controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _controller.addListener(() {
      setState(() {
        
      });
      //print(_controller.value);
      });
    _controller.addStatusListener((status) async { if(status == AnimationStatus.completed){
     // print('completed');
      setState(() {
        _diceVal1 = Random().nextInt(6)+1;
        _diceVal2 = Random().nextInt(6)+1;   
      });
      await _controller.reverse();
      
      //TODO: implement the alert box

      print('show alert box NOW');
      setState(() => val = checkGuess(flag));
      
      obj = new AlertBox(flag: val);

      obj.showMyDialog(context);
      } 
    });
  }

  bool checkGuess(int flag) {
      if(flag == 1 && (_diceVal1%2 == 0 && _diceVal2%2 == 0)) {
        print('evens');
        return true;
      }
      else if(flag == 0 && (_diceVal1%2 != 0 && _diceVal2%2 != 0)) {
        print('odds');
        return true;
      }
      else if(flag == -1 && ((_diceVal1%2 != 0 && _diceVal2%2 == 0) || (_diceVal1%2 == 0 && _diceVal2%2 != 0))){
        print('either');
        return true;
      }
      else {
        print('false');
        return false;
      }
  }

  void bet() {
    showModalBottomSheet(context: context, builder: (context){
      return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.0),
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      setState(() => flag = 1);
                      changeValue();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 30.0, 0, 30.0),
                      child: Center(child: Text(
                        'Evens',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.blue[400],
                          ),
                        )),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Card(
                  child: InkWell(
                    splashColor: Colors.red.withAlpha(30),
                    onTap: () {
                      setState(() => flag = 0);
                      changeValue();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 30.0, 0, 30.0),
                      child: Center(child:Text(
                        'Odds',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.red[400],
                          ),
                        )),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Card(
                  child: InkWell(
                    splashColor: Colors.purple.withAlpha(30),
                    onTap: () {
                      setState(() => flag = -1);                      
                      changeValue();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 30.0, 0, 30.0),
                      child: Center(child: Text(
                        'Pair of Even and Odd',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.purpleAccent[400],
                          ),
                        )),
                    ),
                  ),
                ),
            ],
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return  IconButton(
              icon: Icon(
                  Icons.arrow_back,
                ),
              onPressed: () => quit.showMyDialog(context),
            );
          },
      ),
        backgroundColor: Colors.indigo,
        title: Text('Rolling Dice'),
        centerTitle: true,
      ),

        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onDoubleTap: bet,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Image(
                            height: 200 - animation.value*200,
                            image: AssetImage('assets/$_diceVal1.png'),
                            ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: GestureDetector(
                        onDoubleTap: bet,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Image(
                            height: 200 - animation.value*200,
                            image: AssetImage('assets/$_diceVal2.png')
                            ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 60.0),

                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal:30.0, vertical:10.0),
                  color: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    side: BorderSide(color: Colors.indigo, width: 2.0)
                  ),
                  textColor: Colors.white,
                  onPressed: () {
                    bet();
                  },
                  child: Text(
                    'Place Your Bet',
                    style: TextStyle(
                      fontSize: 18.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ],
            ),
        ),
        );
  }
}