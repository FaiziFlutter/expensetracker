import 'package:flutter/material.dart';
import '../../models/expense_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.expenses});
  final ExpenseModel expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(expenses.title),
          Row(
            children: [
              Text(expenses.amount.toStringAsFixed(2)),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[expenses.category]),
                  Text(expenses.date.toString()),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
