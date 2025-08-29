
import 'package:flutter/material.dart';

import '../widgets/category_pie_chart.dart';

class StatsScreen extends StatelessWidget {
  static const routeName = '/stats';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Expense Breakdown',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            CategoryPieChart(),
          ],
        ),
      ),
    );
  }
}
