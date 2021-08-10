import 'package:flutter/material.dart';

class Themes {
  final theme1 = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(bodyColor: Colors.white, displayColor: Colors.white),
    fontFamily: "SanFrancisco",
  );
}
