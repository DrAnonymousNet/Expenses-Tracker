import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction_list.dart';

class TransactionCard extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTransaction;


  TransactionCard(this.transactions, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 420,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    "No transaction yet !",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 300,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      )),
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  var item = transactions[index];
                  return Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Theme.of(context).primaryColor),
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        child: Text("\$${item.amount.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Column(
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
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          color: Theme.of(context).errorColor,
                          icon: Icon(Icons.delete),
                          onPressed: (() {
                            var tx = transactions.elementAt(index);
                            _deleteTransaction(tx.id);
                          }))
                    ],
                  ));
                }));
  }
}
