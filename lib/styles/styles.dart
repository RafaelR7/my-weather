import 'package:flutter/material.dart';

class Styles {
  static ThemeData mainTheme = ThemeData.light().copyWith(
    textTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
        fontSize: 80,
      ),
      subtitle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      body1: TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
      body2: TextStyle(
        color: Colors.white,
        fontSize: 35,
      ),
    ),
  );
}
