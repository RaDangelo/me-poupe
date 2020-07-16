import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './mainTheme.dart';
import './model/transaction.model.dart';
import './mock/transaction.mock.dart';
import './widgets/transaction_input.dart';
import './widgets/expenses.dart';
import './widgets/weekly_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'Me poupe!',
      theme: MainTheme().themeData,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = TransactionMock().getTransactions();

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransaction(
      String titleValue, double amountValue, DateTime dateValue) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        amount: amountValue,
        title: titleValue,
        date: dateValue);

    setState(() {
      this._transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      this._transactions.removeWhere((element) => element.id == id);
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
        title: Text('Me Poupe\$!'),
        backgroundColor: Theme.of(context).primaryColor,
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
            WeeklyChart(_recentTransactions),
            Expenses(_transactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _toggleTransactionInput(context),
      ),
    );
  }
}
