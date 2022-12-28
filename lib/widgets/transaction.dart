import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction_list.dart';

class TransactionCard extends StatefulWidget {
  final List<Transaction> transactions;

  

  TransactionCard(this.transactions);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  void _deleteTransaction(String id){
    widget.transactions.removeAt(index)
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 420,
        child: widget.transactions.isEmpty ? Column(
          children: [
            Text("No transaction yet !", style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 10,),
            Container(height: 300, child: Image.asset("assets/images/waiting.png", fit: BoxFit.cover,)),
          ],
        ) :ListView.builder(
            itemCount: widget.transactions.length,
            itemBuilder: (context, index) {
              print(context);
              var item = widget.transactions[index];
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Theme.of(context).primaryColor),
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "\$${item.amount.toStringAsFixed(2)}",
                      style:Theme.of(context).textTheme.titleMedium),
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
                    onPressed:(() {
                        
                        })
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