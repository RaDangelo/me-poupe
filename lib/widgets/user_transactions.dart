import 'package:flutter/material.dart';

import '../model/transaction.dart';

import '../widgets/transaction_input.dart';
import '../widgets/expenses.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
  ];

  void _addTransaction(String titleValue, String amountValue) {
    Transaction newTransaction = Transaction(
        id: 't${this._transactions.length}',
        amount: double.parse(amountValue),
        title: titleValue,
        date: DateTime.now());
    setState(() {
      this._transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TransactionInput(_addTransaction),
      Expenses(_transactions),
    ]);
  }
}
