import 'package:flutter/material.dart';

class WeeklyChart extends StatelessWidget {
  const WeeklyChart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,
      child: Card(
        color: Colors.primaries[8],
        child: Text(''),
        elevation: 5,
      ),
    );
  }
}
