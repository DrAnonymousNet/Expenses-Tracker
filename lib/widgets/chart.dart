import 'package:flutter/material.dart';

import '../models/transaction_list.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get _groupTransactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalDayAmount = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        var tx = recentTransactions[i];
        if (tx.date.day == weekDay.day &&
            tx.date.month == tx.date.month &&
            tx.date.year == tx.date.year) {
          totalDayAmount += tx.amount;
        }
      }
      return {"amount": totalDayAmount, "day": DateFormat.E().format(weekDay)};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_groupTransactionValue);
    return Card(
      child: Row(children: []),
    );
  }
}
