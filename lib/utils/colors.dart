import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: orangeAccent);
var orangeAccent = Colors.orangeAccent;
var whiteColor = Colors.white;

var kAppBarTheme = const AppBarTheme().copyWith(
  centerTitle: true,
  elevation: 12,
  backgroundColor: orangeAccent,
  foregroundColor: whiteColor,
);

var kCardTheme = CardTheme().copyWith(
  color: const Color.fromARGB(255, 252, 186, 99),
  margin: EdgeInsets.all(10),
  elevation: 2,
);
var kElevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(orangeAccent),
      foregroundColor: MaterialStatePropertyAll(whiteColor)),
);
var kIconTheme = IconThemeData().copyWith(
  color: whiteColor,
);
