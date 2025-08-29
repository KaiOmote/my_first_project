import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/transaction_provider.dart';
import './screens/home_screen.dart';
import './screens/add_transaction_screen.dart';
import './screens/stats_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => TransactionProvider(),
      child: MaterialApp(
        title: 'Finance Tracker',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
          )
        ),
        home: HomeScreen(),
        routes: {
          AddTransactionScreen.routeName: (ctx) => AddTransactionScreen(),
          StatsScreen.routeName: (ctx) => StatsScreen(),
        },
      ),
    );
  }
}