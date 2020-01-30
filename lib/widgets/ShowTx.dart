import '../Models/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShowTx extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  ShowTx(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No Transactions",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/waiting.png',
                  height: 500,
                  fit: BoxFit.fitHeight,
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: FittedBox(
                          child: Text("Rs ${transactions[index].amount}"),
                        ),
                      ),
                    ),
                    title: Text(
                      '${transactions[index].item}',
                      style: TextStyle(),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteTx(transactions[index].id),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
