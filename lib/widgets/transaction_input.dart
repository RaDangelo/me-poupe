import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  final Function addTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  TransactionInput(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.primaries[8],
              onPressed: () =>
                  addTransaction(titleController.text, amountController.text),
            ),
          ],
        ),
      ),
    );
  }
}
