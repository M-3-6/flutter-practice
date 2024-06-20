import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expensesList, required this.onRemoveExpense, super.key});

  final List<Expense> expensesList;
  final Function(Expense expense) onRemoveExpense;

  @override
  Widget build(context) {
    return ListView.builder(
        itemCount: expensesList.length,
        itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(expensesList[index]),
            onDismissed: (direction) => onRemoveExpense(expensesList[index]),
            child: ExpenseItem(expense: expensesList[index]),
            ),
            );
  }
}
