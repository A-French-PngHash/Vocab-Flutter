import 'package:flutter/material.dart';

class Themes {
  final theme1 = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
    colorScheme: ColorScheme.light(primary: Colors.teal),
    fontFamily: "HurmeGeoSans",
    iconTheme: IconThemeData(color: Color(0xFF94949B), size: 25),
  );
}
