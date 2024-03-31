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
    int expenseIndex = _registeredExpenses.indexOf(expenseModel);
    setState(() {
      _registeredExpenses.remove(expenseModel);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Item is deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expenseModel);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    _registeredExpenses.isEmpty
        ? mainContent
        : mainContent = ExpenseList(
            onRemoveExpense: _onRemoveExpense,
            expenses: _registeredExpenses,
          );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Flutter App'),
        actions: [
          IconButton(onPressed: _modelBottomSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          const Text('Expense Chart'),
          Expanded(
            child: mainContent,
          ),
          const Text('hello'),
        ],
      ),
    );
  }
}
