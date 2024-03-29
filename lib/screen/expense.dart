import 'package:expense_tracker/widget/listview/expense_list.dart';
import 'package:expense_tracker/widget/new_expense.dart';
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

  void _modelBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return NewExpense(
            expense: _addExpense,
          );
        });
  }

  void _addExpense(ExpenseModel expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _onRemoveExpense(ExpenseModel expenseModel) {
    setState(() {
      _registeredExpenses.remove(expenseModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Flutter App'),
        actions: [
          IconButton(onPressed: _modelBottomSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text('Expense Chart'),
          Expanded(
            child: ExpenseList(
              onRemoveExpense: _onRemoveExpense,
              expenses: _registeredExpenses,
            ),
          ),
          Text('hello'),
        ],
      ),
    );
  }
}
