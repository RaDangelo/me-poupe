import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import './model/transaction.dart';

import './widgets/transaction_input.dart';
import './widgets/expenses.dart';
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'Tênis novos',
      amount: 72.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Remédios p/ dor de Cabeça',
      amount: 25.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Remédios p/ dor de Cabeça',
      amount: 25.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Remédios p/ dor de Cabeça',
      amount: 25.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Remédios p/ dor de Cabeça',
      amount: 25.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Remédios p/ dor de Cabeça',
      amount: 25.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Remédios p/ dor de Cabeça',
      amount: 25.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Remédios p/ dor de Cabeça',
      amount: 25.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Remédios p/ dor de Cabeça',
      amount: 25.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Remédios p/ dor de Cabeça',
      amount: 25.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Remédios p/ dor de Cabeça',
      amount: 25.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Remédios p/ dor de Cabeça',
      amount: 25.52,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String titleValue, double amountValue) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        amount: amountValue,
        title: titleValue,
        date: DateTime.now());

    setState(() {
      this._transactions.add(newTransaction);
    });
  }

  void _toggleTransactionInput(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: TransactionInput(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Me poupe\$!'),
        backgroundColor: Colors.primaries[8],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _toggleTransactionInput(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            WeeklyChart(),
            Expenses(_transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.primaries[8],
        onPressed: () => _toggleTransactionInput(context),
      ),
    );
  }
}
