import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'custom_widgets/button.dart';
import 'custom_widgets/textfield.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.expense});
  final void Function(ExpenseModel expenseModel) expense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.leisure;

  void _onExpenseSubmitted() {
    final enteredAmount = double.tryParse(amountController.text);
    final amountIsInvalid = enteredAmount == null || (enteredAmount <= 0);
    if (titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Something went wrong'),
            content: const Text(
                'Please make sure a valid title, amount, date or category is selected '),
            actions: [
              CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  data: 'Okay'),
            ],
          );
        },
      );
      return;
    }
    widget.expense(
      ExpenseModel(
          titleController.text, enteredAmount, selectedDate!, selectedCategory),
    );
    Navigator.pop(context);
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
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
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
              const Spacer(),
              Text(selectedDate == null
                  ? 'No Date Selected'
                  : formatter.format(selectedDate!)),
              IconButton(
                  onPressed: _showDatePicker,
                  icon: const Icon(Icons.calendar_month)),
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
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('cancel')),
              CustomButton(onPressed: _onExpenseSubmitted, data: 'Save'),
            ],
          )
        ],
      ),
    );
  }
}
