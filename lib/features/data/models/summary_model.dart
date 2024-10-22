import 'dart:convert';

import 'package:mandob_app/features/data/models/money_model.dart';

import 'fiat_model.dart';

class SummaryModel {
  List<Moneymodel> transactions;
  double credits;
  double debits;

  SummaryModel({
    required this.transactions,
    required this.credits,
    required this.debits,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    // List<Fiatmodel> fiatsResults = [];
    // List result = jsonDecode(json["fiats"]);
    // result.forEach((ele) {
    //   Fiatmodel newModel = Fiatmodel.fromJson(ele);
    //   fiatsResults.add(newModel);
    // });
    // print(fiatsResults);

    return SummaryModel(
      credits: json["credits"],
      debits: json["debits"],
      transactions: (jsonDecode(json["transactions"]) as List)
          .map((element) => Moneymodel.fromJson(element))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "credits": credits,
      "debits": debits,
      "transactions": jsonEncode(
          transactions.map((transaction) => transaction.toJson()).toList()),
    };
  }
}

// void main() {
//   Fiatmodel fiatModel200 = Fiatmodel(package: 2, ref: 65, type: 200);
//   Fiatmodel fiatModel100 = Fiatmodel(package: 1, ref: 75, type: 100);
//   SummaryModel money = SummaryModel(
//       id: 1,
//       createdDate: "createdDate",
//       fiats: [fiatModel100, fiatModel200],
//       total: 70500);

//   print(money.getTotalAll() == money.total);
// }
