import 'package:expense_tracker/utils/colors.dart';
import 'package:flutter/material.dart';
import '../../models/expense_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.expenses});
  final ExpenseModel expenses;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expenses.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  '\$${expenses.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: darkAccent,
                      fontSize: width * 0.035,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcons[expenses.category],
                      color: whiteColor,
                    ),
                    Text(
                      expenses.date.toString(),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
