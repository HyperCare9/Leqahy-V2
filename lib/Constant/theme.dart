import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: whiteColor,
    primaryColor: mainColor,
    unselectedWidgetColor: mainColor,
    //************ Theme of appBar *********/
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      centerTitle: true,
      color: mainColor,
      actionsIconTheme: IconThemeData(
        size: 25,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        size: 25,
        color: whiteColor,
      ),
    ),
    bottomAppBarColor: mainColor,
    //************ Theme of Text *********/
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 25,
            color: whiteColor,
            fontFamily: 'MYRIADPRO',
            fontStyle: FontStyle.normal),
        headline2: TextStyle(
            fontSize: 20,
            color: whiteColor,
            fontFamily: 'MYRIADPRO',
            fontStyle: FontStyle.normal),
        headline3: TextStyle(
            fontSize: 18,
            color: whiteColor,
            fontFamily: 'MYRIADPRO',
            fontStyle: FontStyle.normal),
        headline4: TextStyle(
            fontSize: 15,
            color: whiteColor,
            fontFamily: 'MYRIADPRO',
            fontStyle: FontStyle.normal),
        bodyText1: TextStyle(
            fontSize: 20,
            color: mainColor,
            fontFamily: 'MYRIADPRO',
            fontStyle: FontStyle.normal),
        bodyText2: TextStyle(
            fontSize: 18,
            color: mainColor,
            fontFamily: 'MYRIADPRO',
            fontStyle: FontStyle.normal),
        subtitle1: TextStyle(
            fontSize: 15,
            color: mainColor,
            fontFamily: 'MYRIADPRO',
            fontStyle: FontStyle.normal),
        subtitle2: TextStyle(
            fontSize: 12,
            color: mainColor,
            fontFamily: 'MYRIADPRO',
            fontStyle: FontStyle.normal)),

    //************ Theme of ElevatedButton *********/
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: mainColor,
            onPrimary: whiteColor,
            textStyle: const TextStyle(
                fontSize: 18, color: whiteColor, fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)))),
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
      alignment: Alignment.center,
    )),

    //************ Theme of InputDecoration *********/
    hintColor: Colors.grey,
    inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        iconColor: mainColor,
        contentPadding: EdgeInsets.all(14.0),
        hintStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        )),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(selectedItemColor: mainColor),
  );
}
