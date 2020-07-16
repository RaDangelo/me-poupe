import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/chart_bar.dart';
import '../model/transaction.model.dart';

class WeeklyChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  WeeklyChart(this.recentTransactions);

  double get _totalSpending {
    return _groupedTransactionValues.fold(
        0.0, (previousValue, element) => previousValue + element['amount']);
  }

  List<Map<String, Object>> get _groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var tx in recentTransactions) {
        if (_isSameDate(tx, weekDay)) {
          totalSum += tx.amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  bool _isSameDate(Transaction transaction, DateTime weekDay) {
    return transaction.date.day == weekDay.day &&
        transaction.date.month == weekDay.month &&
        transaction.date.year == weekDay.year;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(18),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _groupedTransactionValues.map((element) {
              return Expanded(
                child: ChartBar(
                  element['day'],
                  element['amount'],
                  _totalSpending == 0.0
                      ? 0.0
                      : (element['amount'] as double) / _totalSpending,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
