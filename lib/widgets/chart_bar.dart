import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double amount;
  final String label;
  final double spendingPctTotal;

  const ChartBar(this.amount, this.label, this.spendingPctTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(child: Text("\$${amount.toStringAsFixed(0)}"))),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
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
