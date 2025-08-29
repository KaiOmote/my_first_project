
import 'package:flutter/foundation.dart';
import '../models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Groceries',
      amount: 52.50,
      date: DateTime.now().subtract(Duration(days: 1)),
      type: TransactionType.expense,
      category: TransactionCategory.food,
    ),
    Transaction(
      id: 't2',
      title: 'Salary',
      amount: 2500.00,
      date: DateTime.now().subtract(Duration(days: 2)),
      type: TransactionType.income,
      category: TransactionCategory.salary,
    ),
    Transaction(
      id: 't3',
      title: 'New Shoes',
      amount: 120.00,
      date: DateTime.now().subtract(Duration(days: 3)),
      type: TransactionType.expense,
      category: TransactionCategory.shopping,
    ),
     Transaction(
      id: 't4',
      title: 'Netflix Subscription',
      amount: 15.00,
      date: DateTime.now().subtract(Duration(days: 5)),
      type: TransactionType.expense,
      category: TransactionCategory.bills,
    ),
  ];

  List<Transaction> get transactions {
    return [..._transactions];
  }

  void addTransaction(String title, double amount, DateTime chosenDate, TransactionType type, TransactionCategory category) {
    final newTx = Transaction(
      title: title,
      amount: amount,
      date: chosenDate,
      id: DateTime.now().toString(),
      type: type,
      category: category,
    );

    _transactions.insert(0, newTx);
    notifyListeners();
  }

  double get totalBalance {
    return _transactions.fold(0.0, (sum, item) {
      return item.type == TransactionType.income ? sum + item.amount : sum - item.amount;
    });
  }

  List<Transaction> get recentTransactions {
     return _transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }
}
