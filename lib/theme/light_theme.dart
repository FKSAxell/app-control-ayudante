import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Color(0xfff2f2f2),
  primaryColor: Colors.black,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: Color(0xff141414),
    centerTitle: true,
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
    backgroundColor: Color(0xff141414),
    type: BottomNavigationBarType.fixed,
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
