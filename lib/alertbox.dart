import 'package:flutter/material.dart';

class AlertBox {

  String title;
  String msg;
  bool flag;

  AlertBox({this.flag});

  Future<void> showMyDialog(context) async {
    
  if(flag) {
    msg = 'You guessed correctly.';
    title = 'Congratulations!!!';
  }
  else {
    msg = 'You guessed incorrectly.';
    title = 'Sorry!!!';
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('$title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('$msg\n'),
              Text('Keep trying to guess the correct outcome, and see how lucky you are!!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Play Again'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}