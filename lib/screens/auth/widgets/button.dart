import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String buttonText;
  final Function onPressed;

  Button({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF6C63FF),
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Color(0xFF6C63FF), width: 2.0),
          borderRadius:
          BorderRadius.all(Radius.circular(32.0),
          )
      ),
      elevation: 4.0,
      child: FlatButton(
        onPressed: () {
          onPressed;
        },
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
