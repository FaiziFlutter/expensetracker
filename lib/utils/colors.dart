import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: orangeAccent);
var kDarkColorScheme =
    ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: darkAccent);
var orangeAccent = Colors.orangeAccent;
var darkAccent = const Color.fromARGB(255, 5, 99, 125);
var whiteColor = Colors.white;
var blackColor = Colors.black;

///////////////////    Light Theme    ////////////////////

var kAppBarTheme = const AppBarTheme().copyWith(
  centerTitle: true,
  elevation: 12,
  backgroundColor: orangeAccent,
  foregroundColor: whiteColor,
);

var kCardTheme = const CardTheme().copyWith(
  color: const Color.fromARGB(255, 252, 186, 99),
  margin: const EdgeInsets.all(10),
  elevation: 2,
);
var kElevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(orangeAccent),
      foregroundColor: MaterialStatePropertyAll(whiteColor)),
);
var kIconTheme = const IconThemeData().copyWith(
  color: blackColor,
);

////////////////////////    Dark Theme    ///////////////////////

var kDarkCardTheme = const CardTheme().copyWith(
  color: kDarkColorScheme.secondaryContainer,
  margin: const EdgeInsets.all(10),
  elevation: 2,
);
var kDarkElevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
      backgroundColor:
          MaterialStatePropertyAll(kDarkColorScheme.secondaryContainer),
      foregroundColor: MaterialStatePropertyAll(whiteColor)),
);
var kDarkIconTheme = const IconThemeData().copyWith(
  color: whiteColor,
);
