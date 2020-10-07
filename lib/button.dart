import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String name;
  final Function onPressed;

  Button({this.name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        padding: EdgeInsets.symmetric(horizontal:30.0, vertical:10.0),
        color: Colors.blueAccent,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
          side: BorderSide(color: Colors.white, width: 2.0)
        ),
        child: Text(
          '$name',
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            letterSpacing: 2.0,
          ),
        ),
    );
  }
}