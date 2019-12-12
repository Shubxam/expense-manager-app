import '../Models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowTx extends StatelessWidget {
  final List<Transaction> transactions;
  ShowTx(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).accentColor,
            margin: EdgeInsets.all(10),
            elevation: 10,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Rs ${transactions[index].amount.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 19),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].item,
                        style: TextStyle(fontSize: 19),
                      ),
                      Text(DateFormat.yMMMMd().format(transactions[index].date)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
