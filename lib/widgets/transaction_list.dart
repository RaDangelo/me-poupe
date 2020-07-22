import 'package:flutter/material.dart';

import 'transaction_item.dart';
import '../model/transaction.model.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  const TransactionList(this._transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'Nenhuma compra incluída!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(_transactions[index], _deleteTransaction);
            },
            itemCount: _transactions.length,
          );
  }
}
