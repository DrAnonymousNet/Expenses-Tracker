import 'widgets/chart.dart';
import 'package:flutter/material.dart';
import './models/transaction_list.dart';
import 'widgets/transaction.dart';
import 'widgets/input_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "Quicksand",
        textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: TextStyle(fontFamily: "OpenSans", fontSize: 18)),
        appBarTheme: AppBarTheme(
            toolbarTextStyle: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State {
  List<Transaction> transactions = [
    //Transaction(id: 1, title: "Wears", amount: 45.98, date: DateTime.now()),
    //Transaction(id: 2, title: "Groceries", amount: 33.12, date: DateTime.now())
  ];

  void _deleteTransaction(String id) {
    setState(() {
      transactions.removeWhere(((tx) => tx.id == id));
    });
  }

  List<Transaction> get _getRecentTransactions {
    return transactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _createTransaction({String title, double amount, DateTime date}) {
    var tx = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: date);
    setState(() {
      this.transactions.add(tx);
    });
  }

  void _addNewTransactionModal(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return InputData(
              titleController: titleController,
              amountController: amountController,
              createTxEvent: _createTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    print("Hello");
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (() => _addNewTransactionModal(context))),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Chart(_getRecentTransactions),
              TransactionCard(transactions, _deleteTransaction)
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addNewTransactionModal(context),
      ),
    );
  }
}
