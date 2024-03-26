import 'package:expense_tracker/widget/listview/expense_list.dart';
import 'package:flutter/material.dart';

import '../models/expense_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ExpenseModel> _registeredExpenses = [
    ExpenseModel('Flutter Course', 12, DateTime.now(), Category.work),
    ExpenseModel('Udemy Course', 18, DateTime.now(), Category.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Flutter App'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Column(
        children: [
          Text('Expense Chart'),
          Expanded(
            child: ExpenseList(
              expenses: _registeredExpenses,
            ),
          ),
          Text('hello'),
        ],
      ),
    );
  }
}