import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
         colorScheme: const ColorScheme.highContrastLight()),
      home: const Expenses()));
}
