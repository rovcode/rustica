import 'package:flutter/material.dart';

class ColoresApp {
  static String appName = "rovcode";

  //Colores institucionales
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color gris = Color.fromARGB(255, 118, 119, 131);
  static Color azul = Color(0xff5563ff);
  static Color fondoBlanco = Color(0xfffcfcff);
  static Color fondoNaranja = Color(0xffffa900);
  static Color fondoNegro = Colors.black;
  static Color naranja = Color(0xffEF716B);
  static Color amarillo = Color(0xffFFB167);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: fondoNegro,
    primaryColor: darkPrimary,
    accentColor: azul,
    scaffoldBackgroundColor: fondoNegro,
    cursorColor: azul,
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
    accentColor: gris,
    cursorColor: gris,
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
