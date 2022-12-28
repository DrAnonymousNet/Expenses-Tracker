import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';

import '../models/transaction_list.dart';
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
      return {"amount": totalDayAmount, "day": DateFormat.E().format(weekDay).substring(0,1)};
    }).reversed.toList();
  }

  double get _totalSpending {
    return _groupTransactionValue.fold(0.0, (prevSum, tx) {
      return prevSum + tx["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Card(
        
        elevation: 7,
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            ..._groupTransactionValue.map((tx) => Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                tx["amount"],
                tx["day"], 
                _totalSpending == 0.0 ? 0.0 : (tx["amount"] as double) /_totalSpending),
            )).toList()
            ]),
        ),
      ),
    );
  }
}
