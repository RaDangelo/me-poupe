import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.model.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem(
    this._transaction,
    this._deleteTransaction,
  );

  final Transaction _transaction;
  final Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text(
              'R\$${_transaction.amount}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ),
        title: Text(_transaction.title, style: _theme.textTheme.headline6),
        subtitle: Text(DateFormat.yMMMMd('pt_BR').format(_transaction.date)),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                textColor: _theme.errorColor,
                onPressed: () => _deleteTransaction(_transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: _theme.errorColor,
                onPressed: () => _deleteTransaction(_transaction.id),
              ),
      ),
    );
  }
}
