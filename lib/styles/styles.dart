import 'package:flutter/material.dart';

class Styles {
  static ThemeData mainTheme = ThemeData.light().copyWith(
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 80,
      ),
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
    ),
  );
}
