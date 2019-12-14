import './widgets/ShowTx.dart';
import 'package:google_fonts/google_fonts.dart';

import './Models/Transaction.dart';

import './widgets/AddTx.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        accentColor: Colors.limeAccent,
        textTheme: TextTheme(body1: GoogleFonts.quicksand()),
      ),
      title: 'Expense Planner',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void startAddTxn(context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AddTx(addTxnMethod);
      },
    );
  }

  void addTxnMethod(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  final List<Transaction> transactions = [
    // Transaction(
    //   amount: 250,
    //   item: 'Shoes',
    //   id: DateTime.now().toString(),
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   date: DateTime.now(),
    //   id: DateTime.now().toString(),
    //   item: 'Grocery',
    //   amount: 200,
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Planner",
          style: GoogleFonts.anonymousPro(fontWeight: FontWeight.bold, textStyle: TextStyle(letterSpacing: 3)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Card(
                child: Text("Graph Here"),
                elevation: 5,
                color: Theme.of(context).primaryColor,
                margin: EdgeInsets.all(10),
              ),
            ),
            // AddTx(addTxnMethod),
            ShowTx(transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle_outline),
        onPressed: () => startAddTxn(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
