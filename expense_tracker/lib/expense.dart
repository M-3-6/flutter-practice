import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, accomodation, work, leisure }

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.flight,
  Category.accomodation: Icons.hotel,
  Category.work: Icons.work,
  Category.leisure: Icons.attractions_sharp,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}

class ExpenseBucket {
  ExpenseBucket({required this.expenses, required this.category});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  List<Expense> expenses;
  Category category;

  double get totalExpenses {
    double sum = 0;
    for (var expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
