import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import '../models/transaction.dart';
import '../providers/transaction_provider.dart';

class CategoryPieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    final expenseTransactions = transactionProvider.transactions
        .where((tx) => tx.type == TransactionType.expense)
        .toList();

    Map<TransactionCategory, double> categoryExpenses = {};
    for (var tx in expenseTransactions) {
      categoryExpenses.update(tx.category, (value) => value + tx.amount, ifAbsent: () => tx.amount);
    }

    List<PieChartSectionData> pieChartSections = categoryExpenses.entries.map((entry) {
      final isTouched = false; // for now
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      return PieChartSectionData(
        color: _getCategoryColor(entry.key),
        value: entry.value,
        title: '${entry.key.toString().split('.').last}\n\$${entry.value.toStringAsFixed(2)}',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
      );
    }).toList();

    return Container(
      height: 300,
      child: pieChartSections.isEmpty
          ? Center(
              child: Text('No expense data to display.'),
            )
          : PieChart(
              PieChartData(
                sections: pieChartSections,
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
              ),
            ),
    );
  }

  Color _getCategoryColor(TransactionCategory category) {
    switch (category) {
      case TransactionCategory.food:
        return Colors.red;
      case TransactionCategory.transport:
        return Colors.blue;
      case TransactionCategory.shopping:
        return Colors.green;
      case TransactionCategory.bills:
        return Colors.orange;
      case TransactionCategory.entertainment:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
