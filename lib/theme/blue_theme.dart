import 'package:flutter/material.dart';

final blueTheme = ThemeData.light().copyWith(
  backgroundColor: Color(0xfff2f2f2),
  primaryColor: Color(0xff243165),
  // canvasColor: Color(0xff243165),
  brightness: Brightness.dark,

  appBarTheme: AppBarTheme().copyWith(
    brightness: Brightness.dark,
    backgroundColor: Color(0xff243165),
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: Color(0xff243165),
    unselectedItemColor: Color(0xff47525E),
    // selectedItemColor: Colors.white,
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
