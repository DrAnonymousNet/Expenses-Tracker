import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction_list.dart';

class TransactionCard extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionCard(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 420,
        child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              print(context);
              var item = transactions[index];
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.purple),
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "\$${item.amount.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.purple),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat.yMMMMEEEEd().format(item.date),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ));
            }));
  }
}
 
       
       
/*        children: transactions
            .map((item) => Card(
                    child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.purple),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "\$${item.amount}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMMEEEEd().format(item.date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                )))
            .toList(),
*/    