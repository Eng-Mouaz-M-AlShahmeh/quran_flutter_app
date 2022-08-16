/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';

class AppStyle {
  static const double padding = 20.0;
  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(
        blurRadius: 5, spreadRadius: 1, color: Colors.black.withOpacity(0.1))
  ];
  static const Color primaryColor = Color(0xFF31B9CE);
  static const Color secondaryColor = Color(0xFF21859B);
  static const Color whiteColor = Color(0xffFEFEFE);
  static const Color darkColor = Color(0xff323540);
  static const Color darkColor2 = Color(0xff454A5C);
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 26,
  );
  static const TextStyle bodyTextStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static const TextStyle ayahTextStyle = TextStyle(
    fontSize: 16,
  );
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Questv',
    primaryColor: primaryColor,
    scaffoldBackgroundColor: whiteColor,
    colorScheme: const ColorScheme.light(),
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Questv',
    colorScheme: const ColorScheme.dark(),
    primaryColor: primaryColor,
    scaffoldBackgroundColor: darkColor,
  );
}
