import 'package:flutter/material.dart';

import '../../data/models/fiat_model.dart';
import '../../data/models/money_model.dart';
import '../widgets/money_row_widget.dart';
import '../widgets/total_all_widget.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    ///
    ///
    ///
    Fiatmodel fiatModel200 = Fiatmodel(
        package: 2, ref: 65, type: 200, color: const Color(0xf0FFFF00));
    Fiatmodel fiatModel100 = Fiatmodel(
        package: 1, ref: 75, type: 100, color: const Color(0xf0808080));
    Fiatmodel fiatModel50 = Fiatmodel(
        package: 1, ref: 75, type: 50, color: const Color(0xf0FF0000));
    Fiatmodel fiatModel20 = Fiatmodel(
        package: 1, ref: 75, type: 20, color: const Color(0xf0008000));
    Fiatmodel fiatModel10 =
        Fiatmodel(package: 1, ref: 2, type: 10, color: Colors.orange);
    Fiatmodel fiatModel05 =
        Fiatmodel(package: 1, ref: 32, type: 5, color: Colors.blue);
    Fiatmodel fiatModel01 =
        Fiatmodel(package: 0, ref: 7, type: 1, color: Colors.brown);
    Moneymodel money = Moneymodel(
        id: 1,
        createdDate: DateTime(2023, 07, 25),
        fiats: [
          fiatModel200,
          fiatModel100,
          fiatModel50,
          fiatModel20,
          fiatModel10,
          fiatModel05,
          fiatModel01,
        ],
        total: 70500);

    ///
    ///
    ///
    ///
    final formatter = DateFormat('yyyy-MM-dd');
    final formattedDate = formatter.format(money.createdDate);

    ///
    ///
    ///

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...money.fiats.map((moneyTransaction) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: MoneyRow(
                    fiat: Fiatmodel(
                      package: moneyTransaction.package,
                      ref: moneyTransaction.ref,
                      type: moneyTransaction.type,
                      color: moneyTransaction.color,
                    ),
                  ),
                );
              }),
              TotalAllWidget(
                totalAllAmount: money.getTotalAll(),
              ),
              Wrap(
                children: [
                  Icon(
                    Icons.timer_sharp,
                    color: Colors.grey,
                  ),
                  Text("Trasaction Date:"),
                  Text(formattedDate),
                ],
              ),
              Wrap(
                children: [
                  Icon(
                    Icons.create,
                    color: Colors.grey,
                  ),
                  Text("edit Time:"),
                  Text(formattedDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
