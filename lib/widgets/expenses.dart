import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.model.dart';

class Expenses extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  Expenses(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Nenhuma compra incluída!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
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
                          style: Theme.of(context).textTheme.headline6),
                      subtitle: Text(DateFormat.yMMMMd('pt_BR')
                          .format(transactions[index].date)),
                      trailing: IconButton(
                          onPressed: () =>
                              deleteTransaction(transactions[index].id),
                          icon: Icon(Icons.delete)),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
