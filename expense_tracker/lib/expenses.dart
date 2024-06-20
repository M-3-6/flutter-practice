import 'package:expense_tracker/chart/chart.dart';
import 'package:expense_tracker/expense.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expensesList = [
    Expense(
        title: 'Flutter Course',
        amount: 550,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Masala Dosa',
        amount: 100,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Bus',
        amount: 10,
        date: DateTime.now(),
        category: Category.travel),
  ];

  void _addItemOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _expensesList.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    int idx = _expensesList.indexOf(expense);
    setState(() {
      _expensesList.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Expense deleted!'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(label: 'Undo', onPressed: () {
        setState(() {
          _expensesList.insert(idx, expense);
        });
      }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Text('No content to display!');
    _expensesList.isNotEmpty
        ? mainContent = ExpensesList(
            expensesList: _expensesList, onRemoveExpense: _removeExpense)
        : const Text('No content to display!');
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        actions: [
          IconButton(onPressed: _addItemOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _expensesList),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
