import 'package:flutter/material.dart';

class InputData extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController amountController;
  final Function createTxEvent;

  InputData({this.titleController, this.amountController, this.createTxEvent});

  void submitData(context) {
    var enteredTitle = titleController.text.toString();
    var enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    createTxEvent(
        title: enteredTitle, amount: enteredAmount, date: DateTime.now());
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          //decoration: BoxDecoration(border: Border.all(width: 3, color: Colors.purple)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
                controller: titleController,
                onSubmitted: (_) => submitData(context),
                decoration: InputDecoration(
                    labelText: "Title",
                    icon: Icon(Icons.abc),
                    hintText: "The title of the transaction")),
            TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(context),
                decoration: InputDecoration(
                    labelText: "Amount",
                    icon: Icon(Icons.money),
                    hintText: "The amount of the transaction")),
            TextButton(onPressed:(() =>  submitData(context)), child: Text("Add Transaction"))
          ]),
        ),
      ),
    );
  }
}
