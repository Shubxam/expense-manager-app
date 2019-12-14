import 'package:flutter/material.dart';
import '../Models/Transaction.dart';

class AddTx extends StatefulWidget {
  final Function addTxnFn;
  AddTx(this.addTxnFn);

  @override
  _AddTxState createState() => _AddTxState();
}

class _AddTxState extends State<AddTx> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void addTxnLocal() {
    if ((titleController.text).isEmpty ||
        double.parse(amountController.text) <= 0) {
      return;
    }
    widget.addTxnFn(
      Transaction(
        amount: double.parse(amountController.text),
        item: titleController.text,
        id: DateTime.now().toString(),
        date: DateTime.now(),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              // onSubmitted: (_) {
              //   addTxnLocal();
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              // onSubmitted: (_) {
              //   addTxnLocal();
              // },
            ),
            FlatButton(
              child: Text("Submit"),
              textColor: Colors.purple,
              onPressed: addTxnLocal,
            )
          ],
        ),
      ),
    );
  }
}
