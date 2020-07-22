import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/chart_bar.dart';
import '../model/transaction.model.dart';

class WeeklyChart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  const WeeklyChart(this._recentTransactions);

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

      for (var tx in _recentTransactions) {
        if (_isSameDate(tx, weekDay)) {
          totalSum += tx.amount;
        }
      }

      return {
        'day':
            DateFormat.E('pt_BR').format(weekDay).substring(0, 1).toUpperCase(),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  bool _isSameDate(Transaction transaction, DateTime weekDay) {
    return transaction.date.day == weekDay.day &&
        transaction.date.month == weekDay.month &&
        transaction.date.year == weekDay.year;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
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
    );
  }
}
