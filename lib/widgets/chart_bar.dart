import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String _label;
  final double _spendingAmount;
  final double _spendingPercentage;

  const ChartBar(this._label, this._spendingAmount, this._spendingPercentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text('R\$${_spendingAmount.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromRGBO(220, 220, 220, 1),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: _spendingPercentage,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(child: Text(_label))),
          ],
        );
      },
    );
  }
}
