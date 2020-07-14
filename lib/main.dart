import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import './widgets/user_transactions.dart';
import './widgets/weekly_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR');
    return MaterialApp(
      title: 'Me poupe\$!',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Me poupe\$!'),
        backgroundColor: Colors.primaries[8],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          WeeklyChart(),
          UserTransactions(),
        ],
      ),
    );
  }
}
