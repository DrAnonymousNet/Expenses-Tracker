import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputData extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController amountController;
  DateTime _pickedDate;
  final Function createTxEvent;

  InputData({this.titleController, this.amountController, this.createTxEvent});

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  void _chooseDate(context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        widget._pickedDate = value;
      });
    });
  }

  void submitData(context) {
    var enteredTitle = widget.titleController.text.toString();
    var enteredAmount = double.parse(widget.amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || widget._pickedDate == null) {
      return;
    }

    widget.createTxEvent(
        title: enteredTitle, amount: enteredAmount, date: widget._pickedDate);
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
                controller: widget.titleController,
                onSubmitted: (_) => submitData(context),
                decoration: InputDecoration(
                    labelText: "Title",
                    icon: Icon(Icons.abc),
                    hintText: "The title of the transaction")),
            TextField(
                controller: widget.amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(context),
                decoration: InputDecoration(
                    labelText: "Amount",
                    icon: Icon(Icons.money),
                    hintText: "The amount of the transaction")),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(child: Text(widget._pickedDate == null ? "No date choosed !" : "You picked "+ DateFormat.yMd().format(widget._pickedDate))),
                  TextButton(
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    onPressed: (() {
                      return _chooseDate(context);
                    }),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: (() => submitData(context)),
              child: Text("Add Transaction"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
            )
          ]),
        ),
      ),
    );
  }
}
