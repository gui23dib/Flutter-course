import 'package:flutter/material.dart';

import 'mainScreen.dart';

void main() {
  runApp(CalcIMC());
}

class CalcIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF616161),
        scaffoldBackgroundColor: Color(0xFF616161),
      ),
    );
  }
}
