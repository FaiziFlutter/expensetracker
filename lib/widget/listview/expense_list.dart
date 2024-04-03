import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widget/listview/item_list.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expenseModel) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Dismissible(
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              key: ValueKey(expenses[index]),
              child: ListItem(expenses: expenses[index]));
        },
      ),
    );
  }
}
