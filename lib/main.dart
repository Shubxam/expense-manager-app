import './widgets/ShowTx.dart';

import './Models/Transaction.dart';

import './widgets/AddTx.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expense Planner"),
        ),
        body: SingleChildScrollView(child: MyHomePage()),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addTxnMethod(Transaction transaction){
    setState(() {
      transactions.add(transaction);
    });
  }
  final List<Transaction> transactions = [
    Transaction(
      amount: 250,
      item: 'Shoes',
      id: DateTime.now().toString(),
      date: DateTime.now(),
    ),
    Transaction(
      date: DateTime.now(),
      id: DateTime.now().toString(),
      item: 'Grocery',
      amount: 200,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Card(
            child: Text("Graph Here"),
            elevation: 5,
            color: Colors.brown,
            margin: EdgeInsets.all(10),
          ),
        ),
        AddTx(addTxnMethod),
        ShowTx(transactions),
      ],
    );
  }
}
