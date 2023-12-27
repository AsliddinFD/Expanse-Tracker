import 'package:expanse_tracker/main.dart';
import 'package:expanse_tracker/models/expense.dart';
import 'package:expanse_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });
  final void Function(Expense expense) removeExpense;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (directon) {
          removeExpense(
            expenses[index],
          );
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
