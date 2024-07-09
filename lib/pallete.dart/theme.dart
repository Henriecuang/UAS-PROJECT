import 'package:flutter/material.dart';

class Pallete {
  static const blackColor = Colors.black;
  static const whiteColor = Colors.white;
  static const grayColor = Colors.black54;
  static const whiteColoor = Colors.white38;
  static const blueColor = Colors.blue;
  static const Transparent = Colors.transparent;

  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
  );
  static var lightModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: whiteColoor,
  );
}
