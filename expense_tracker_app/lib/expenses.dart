import 'package:expense_tracker_app/widgets/expenses_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/expense.dart';

class Expenses extends StatefulWidget {
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

  Expenses();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expensesList = [
    Expense(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), category: Category.leisure),
    Expense(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), category: Category.leisure),
    Expense(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), category: Category.leisure),
    Expense(title: 'Flutter Course', amount: 19.99, date: DateTime.now(), category: Category.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('The Chart'),
            Expanded(child: ExpensesList(expenses: _expensesList))
          ],
        ),
      ),
    );
  }
}
