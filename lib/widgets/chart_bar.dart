import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChartBar extends StatelessWidget {
  final double amount;
  final String label;
  final double spendingPctTotal;

  const ChartBar(this.amount, this.label, this.spendingPctTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${amount.toStringAsFixed(0)}"),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.black),
                  color: Colors.grey
                  ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctTotal,
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                )),
              )
            ]),
        ),
        SizedBox(height: 4,),
        Text(label)
      ],
    );
  }
}
