import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color primaryDarkColor = Color(0xFF141A2E);
  static const Color onPrimaryDarkColor = Color(0xFFFACC10);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        fontFamily: "El Messiri",
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
          fontFamily: "El Messiri",
          fontSize: 17,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(
            fontFamily: "El Messiri",
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.normal),
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        )),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "El messiri",
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: "El messiri",
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: "El messiri",
        fontSize: 25,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: "El messiri",
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    dividerTheme: const DividerThemeData(color: primaryColor),
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryDarkColor,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: onPrimaryDarkColor),
        titleTextStyle: TextStyle(
          fontFamily: "El Messiri",
          color: onPrimaryDarkColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: primaryDarkColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: onPrimaryDarkColor,
          selectedLabelStyle: TextStyle(
            fontFamily: "El Messiri",
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: onPrimaryDarkColor,
          ),
          selectedIconTheme: IconThemeData(
            color: onPrimaryDarkColor,
          ),
          unselectedItemColor: Colors.white,
          unselectedLabelStyle: TextStyle(
              fontFamily: "El Messiri",
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.normal),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
          )),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "El messiri",
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: "El messiri",
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: "El messiri",
          fontSize: 25,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontFamily: "El messiri",
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      dividerTheme: const DividerThemeData(color: onPrimaryDarkColor));
}
