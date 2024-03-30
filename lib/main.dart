import 'package:expense_tracker/screen/expense.dart';
import 'package:expense_tracker/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: kColorScheme,
        appBarTheme: kAppBarTheme,
        cardTheme: kCardTheme,
        elevatedButtonTheme: kElevatedButtonTheme,
        iconTheme: kIconTheme,
        primaryColor: Colors.orangeAccent,
      ),
      home: const HomeScreen(),
    );
  }
}
