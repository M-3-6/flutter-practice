import 'package:expense_tracker/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({required this.expense, super.key});

  final Expense expense;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20
        ),
        child: Column(
          children: [
            Text(expense.title, textAlign: TextAlign.center),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Rs." + expense.amount.toString()),
                Text(DateFormat.yMd().format(expense.date).toString()),
                Icon(categoryIcons[expense.category])
              ],
            )
          ],
        ),),
      );
  }
  
}