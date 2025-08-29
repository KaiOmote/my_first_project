
import 'package:flutter/foundation.dart';

enum TransactionType {
  income,
  expense,
}

enum TransactionCategory {
  food,
  transport,
  shopping,
  bills,
  entertainment,
  salary,
  other,
}

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final TransactionType type;
  final TransactionCategory category;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  });
}
