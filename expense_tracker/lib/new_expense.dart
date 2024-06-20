import 'package:expense_tracker/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final Function(Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory = Category.values.first;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    DateTime? pickedDate;
    pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _onSaveExpense() {
    final invalidTitle = _titleController.text.trim() == "";
    final invalidDate = _selectedDate == null;
    final amount = double.tryParse(_amountController.text);
    final invalidAmount = amount == null || amount <= 0;

    if (invalidTitle || invalidAmount || invalidDate) {
      showDialog<void>(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Invalid input value!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          );
        },
      );

      return;
    }
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: amount,
        date: _selectedDate!,
        category: _selectedCategory!));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          TextField(
            controller: _amountController,
            maxLength: 10,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(label: Text('Amount'), prefixText: 'Rs.'),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                    Text(_selectedDate == null
                        ? 'No Date Selected'
                        : DateFormat.yMd().format(_selectedDate!).toString()),
                  ],
                ),
              ),
              DropdownButton<Category>(
                value: _selectedCategory,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: (Category? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                items: Category.values.map<DropdownMenuItem<Category>>((value) {
                  return DropdownMenuItem<Category>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: _onSaveExpense, child: const Text('Save Expense')),
            ],
          ),
        ],
      ),
    );
  }
}
