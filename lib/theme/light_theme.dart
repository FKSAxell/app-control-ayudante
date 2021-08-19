import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Color(0xfff2f2f2),
  primaryColor: Colors.black,
  canvasColor: Color(0xff141414),
  brightness: Brightness.dark,

  appBarTheme: AppBarTheme().copyWith(
    brightness: Brightness.dark,
    backgroundColor: Color(0xff141414),
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
    type: BottomNavigationBarType.shifting,
    unselectedItemColor: Colors.white60,
    selectedItemColor: Colors.white,
  ),
  primaryIconTheme: IconThemeData().copyWith(
    color: Colors.white,
  ),
  iconTheme: IconThemeData().copyWith(
    color: Colors.black,
  ),

  // textTheme: TextTheme().copyWith(),
  buttonColor: Colors.blue,
);
