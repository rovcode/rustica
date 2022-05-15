import 'package:flutter/material.dart';

class ColoresApp {
  static String appName = "rovcode";

  //Colores institucionales
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Color(0xff5563ff);
  static Color darkAccent = Color(0xff5563ff);
  static Color fondoBlanco = Color(0xfffcfcff);
  static Color fondoNaranja = Color(0xffffa900);
  static Color fondoNegro = Colors.black;

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: fondoNegro,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: fondoNegro,
    cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: fondoBlanco,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    backgroundColor: fondoBlanco,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: fondoBlanco,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: fondoBlanco,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
