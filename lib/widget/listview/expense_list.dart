import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widget/listview/item_list.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses});
  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return ListItem(expenses: expenses[index]);
      },
    );
  }
}
