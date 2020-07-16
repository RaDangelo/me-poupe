import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionInput extends StatefulWidget {
  final Function addTransaction;

  TransactionInput(this.addTransaction);

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final typedTitle = _titleController.text;
    final typedAmount = _amountController.text.isEmpty
        ? 0
        : double.parse(_amountController.text);

    if (typedTitle.isEmpty || typedAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTransaction(
      typedTitle,
      typedAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() => _selectedDate = pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(children: <Widget>[
                Text(_selectedDate == null
                    ? 'Selecione uma data:'
                    : 'Data selecionada: ${DateFormat.yMd('pt_BR').format(_selectedDate)}'),
                IconButton(
                  icon: Icon(
                    Icons.date_range,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: _showDatePicker,
                )
              ]),
            ),
            RaisedButton(
              child: Text('Incluir'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
