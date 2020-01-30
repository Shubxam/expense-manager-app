import 'package:flutter/material.dart';
import '../Models/Transaction.dart';
import 'package:intl/intl.dart';

class AddTx extends StatefulWidget {
  final Function addTxnFn;
  AddTx(this.addTxnFn);

  @override
  _AddTxState createState() => _AddTxState();
}

class _AddTxState extends State<AddTx> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime selectedDate;

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
        date: selectedDate,
      ),
    );
    Navigator.of(context).pop();
  }

  void pickDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
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
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    selectedDate == null
                        ? "No date selected"
                        : "Selected date is : ${DateFormat.yMMMd().format(selectedDate)}",
                  ),
                  FlatButton(
                    child: Text(
                      "Select date",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: pickDate,
                  ),
                ],
              ),
            ),
            Center(
              child: RaisedButton(
                child: Text(
                  "Add Transaction",
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: addTxnLocal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
