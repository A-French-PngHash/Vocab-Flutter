import 'package:flutter/material.dart';

class Themes {
  final theme1 = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(primary: Colors.orange),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 50),
      bodyText2: TextStyle(fontSize: 17),
      bodyText1: TextStyle(color: Color(0xFF94949B), fontSize: 17),
    ).apply(bodyColor: Colors.white, displayColor: Colors.white),
    fontFamily: "HurmeGeoSans",
    iconTheme: IconThemeData(color: Color(0xFF94949B), size: 25),
  );
}
