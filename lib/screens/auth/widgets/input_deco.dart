import 'package:flutter/material.dart';

const KTextInputDeco = InputDecoration(
  labelStyle: TextStyle(color: Color(0xFF6C63FF)),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
        color: Color(0xFF6C63FF), width: 2.0),
    borderRadius:
    BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xFF6C63FF), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0),),
  ),
);