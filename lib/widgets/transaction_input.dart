import 'package:flutter/material.dart';

class TransactionInput extends StatefulWidget {
  final Function addTransaction;

  TransactionInput(this.addTransaction);

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _submitData() {
    final typedTitle = titleController.text;
    final typedAmount =
        amountController.text.isEmpty ? 0 : double.parse(amountController.text);

    if (typedTitle.isEmpty || typedAmount <= 0) {
      return;
    }

    widget.addTransaction(
      typedTitle,
      typedAmount,
    );

    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              // TextInputType.numberWithOptions(signed: true, decimal: true),
              onSubmitted: (_) => _submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.primaries[8],
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
