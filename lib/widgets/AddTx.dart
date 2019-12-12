import 'package:flutter/material.dart';
import '../Models/Transaction.dart';

class AddTx extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final Function addTxnFn;
  AddTx(this.addTxnFn);
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
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
            ),
            RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                addTxnFn(
                  Transaction(
                    amount: double.parse(amountController.text),
                    item: titleController.text,
                    id: DateTime.now().toString(),
                    date: DateTime.now(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
