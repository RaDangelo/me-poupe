import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.model.dart';

class Expenses extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  Expenses(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'Nenhuma compra incluída!',
                  style: _theme.textTheme.headline6,
                ),
                SizedBox(
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
              return Container(
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text(
                          'R\$${transactions[index].amount}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: _theme.textTheme.headline6),
                    subtitle: Text(DateFormat.yMMMMd('pt_BR')
                        .format(transactions[index].date)),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? FlatButton.icon(
                            textColor: _theme.errorColor,
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                            icon: Icon(Icons.delete),
                            label: Text('Excluir'))
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: _theme.errorColor,
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                          ),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
