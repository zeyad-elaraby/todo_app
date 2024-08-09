import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryLightColor = Color(0xFFFFFFFF);
Color primaryDarkColor = Color(0xFF141922);
Color blueColor = Color(0xFF5D9CEC);
Color lightBackGroundColor = Color(0xFFdfecdb);
Color darkBackGroundColor = Color(0xFF080c1c);
Color appBarTitleDarkColor = Color(0xFF060E1E);

Color whiteColor = Colors.white;
Color greyColor = Color(0xFFC8C9CB);

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      primaryColor: blueColor,
      appBarTheme: AppBarTheme(
        backgroundColor: blueColor,
        titleTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w700, fontSize: 23, color: whiteColor),
      ),
      scaffoldBackgroundColor: lightBackGroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: blueColor,
        unselectedItemColor: greyColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        padding: EdgeInsets.all(0),
        shape: CircularNotchedRectangle(),
        color: whiteColor,
        height: 65,
      ),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: whiteColor),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
        labelLarge: GoogleFonts.poppins(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
        labelMedium: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
        labelSmall: GoogleFonts.poppins(
            fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
        headlineLarge: GoogleFonts.inder(
            fontSize: 20, fontWeight: FontWeight.w400, color: blueColor),
        headlineMedium: GoogleFonts.inder(
            fontSize: 14, fontWeight: FontWeight.w400, color: blueColor),
        headlineSmall: GoogleFonts.inder(
            fontSize: 10, fontWeight: FontWeight.w400, color: blueColor),
        bodyLarge: GoogleFonts.inder(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black54),
        bodyMedium: GoogleFonts.inder(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black54),
        bodySmall: GoogleFonts.inder(
            fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black54),
        displayLarge: GoogleFonts.inder(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
        displayMedium: GoogleFonts.inder(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
        displaySmall: GoogleFonts.inder(
            fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: blueColor,
      ));
  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryDarkColor,
      appBarTheme: AppBarTheme(
        backgroundColor: blueColor,
        titleTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 23,
            color: appBarTitleDarkColor),
      ),
      scaffoldBackgroundColor: darkBackGroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: blueColor,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        padding: EdgeInsets.all(0),
        shape: CircularNotchedRectangle(),
        color: primaryDarkColor,
        height: 65,
      ),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: primaryDarkColor),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        titleMedium: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
        labelLarge: GoogleFonts.poppins(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
        labelMedium: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
        labelSmall: GoogleFonts.poppins(
            fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),
        headlineLarge: GoogleFonts.inder(
            fontSize: 20, fontWeight: FontWeight.w400, color: blueColor),
        headlineMedium: GoogleFonts.inder(
            fontSize: 14, fontWeight: FontWeight.w400, color: blueColor),
        headlineSmall: GoogleFonts.inder(
            fontSize: 10, fontWeight: FontWeight.w400, color: blueColor),
        bodyLarge: GoogleFonts.inder(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
        bodyMedium: GoogleFonts.inder(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
        bodySmall: GoogleFonts.inder(
            fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),
        displayLarge: GoogleFonts.inder(
            fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
        displayMedium: GoogleFonts.inder(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
        displaySmall: GoogleFonts.inder(
            fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: blueColor,
      ));
}
