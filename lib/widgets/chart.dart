import 'package:expense_planner_new/Models/Transaction.dart';
import 'package:expense_planner_new/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> weeklyTransactions;
  Chart(this.weeklyTransactions);
  List<Map<String, Object>> get txnList {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(Duration(days: index));
      var dailyTxn = 0.0;
      for (int i = 0; i < weeklyTransactions.length; i++) {
        if (weeklyTransactions[i].date.day == weekDay.day) {
          dailyTxn += weeklyTransactions[i].amount;
        }
      }
      print(dailyTxn);
      print(weekDay.day);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': dailyTxn
      };
    }).reversed.toList();
  }

  double get weeklyTotal {
    return txnList.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(txnList);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Row(
          children: txnList.map((day) {
            return Flexible(
              fit: FlexFit.tight,
              child: Column(
                children: <Widget>[
                  //Text("${day['day']} : ${day['amount']} "),

                  ChartBar(
                    spendingTotal: day['amount'],
                    spendingPct: weeklyTotal == 0
                        ? 0.0
                        : (day['amount'] as double) / weeklyTotal,
                    weekDay: day['day'],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
