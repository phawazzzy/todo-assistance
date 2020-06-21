import 'package:flutter/material.dart';
import 'package:todoassistance/onboarding/onboardScreen.dart';
import 'package:todoassistance/screens/auth/register.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoard(),
    );
  }
}



