import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

import 'button.dart';
import 'textfield.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.leisure;

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  _showDatePicker() async {
    DateTime now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: now,
      initialDate: now,
    );
    setState(() {
      selectedDate = pickedDate;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(width * 0.04),
      child: Column(
        children: [
          CustomTextField(
            controller: titleController,
            label: 'Title',
            maxLength: 50,
          ),
          Row(
            children: [
              CustomTextField(
                width: width * 0.4,
                label: 'Amount',
                keyboardType: TextInputType.number,
                prefixText: '\$',
                controller: amountController,
              ),
              Spacer(),
              Text(selectedDate == null
                  ? 'No Date Selected'
                  : formatter.format(selectedDate!)),
              IconButton(
                  onPressed: _showDatePicker, icon: Icon(Icons.calendar_month)),
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                items: Category.values.map((category) {
                  return DropdownMenuItem(
                      value: category,
                      child: Text(category.name.toUpperCase()));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    if (value == null) {
                      return;
                    }

                    selectedCategory = value;
                  });
                },
              ),
              Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel')),
              CustomButton(
                  onPressed: () {
                    print(
                        'Title: $titleController and Amount: $amountController');
                  },
                  data: 'Save'),
            ],
          )
        ],
      ),
    );
  }
}

_dropDownMenu() {}
