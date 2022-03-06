import 'package:flutter/material.dart';

class Themes {
  final theme1 = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.orange,
    colorScheme: ColorScheme.light(primary: Colors.blueGrey),
    fontFamily: "HurmeGeoSans",
    iconTheme: IconThemeData(color: Color(0xFF94949B), size: 25),
  );
}
