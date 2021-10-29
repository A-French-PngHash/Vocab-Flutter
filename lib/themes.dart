import 'package:flutter/material.dart';

class Themes {
  final theme1 = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(primary: Colors.orange),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 50),
      bodyText2: TextStyle(fontSize: 17),
      bodyText1: TextStyle(color: Color(0xFF94949B), fontSize: 17),
    ).apply(bodyColor: Colors.white, displayColor: Colors.white),
    fontFamily: "SanFrancisco",
    iconTheme: IconThemeData(color: Color(0xFF94949B), size: 25),
  );
}
