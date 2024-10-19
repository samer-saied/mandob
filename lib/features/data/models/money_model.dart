import 'dart:convert';

import 'fiat_model.dart';

class Moneymodel {
  final int id;
  final DateTime createdDate;
  final DateTime? editedDate;
  List<Fiatmodel> fiats;
  bool transactionsType;
  final double total;
  String? description;

  Moneymodel({
    required this.id,
    required this.createdDate,
    this.editedDate,
    required this.fiats,
    this.transactionsType = true,
    required this.total,
    this.description,
  });

  factory Moneymodel.fromJson(Map<String, dynamic> json) {
    // List<Fiatmodel> fiatsResults = [];
    // List result = jsonDecode(json["fiats"]);
    // result.forEach((ele) {
    //   Fiatmodel newModel = Fiatmodel.fromJson(ele);
    //   fiatsResults.add(newModel);
    // });
    // print(fiatsResults);

    return Moneymodel(
      id: json["id"],
      createdDate: DateTime.parse(json["createdDate"]),
      editedDate: json["editedDate"] != null
          ? DateTime.parse(json["editedDate"])
          : null,
      fiats: (jsonDecode(json["fiats"]) as List)
          .map((element) => Fiatmodel.fromJson(element))
          .toList(),
      transactionsType: json["transactionsType"] == 1 ? true : false,
      total: json["total"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "createdDate": createdDate.toIso8601String(),
      "editedDate": editedDate != null
          ? editedDate!.toIso8601String()
          : createdDate.toIso8601String(),
      "fiats": jsonEncode(fiats.map((fiat) => fiat.toJson()).toList()),
      "transactionsType": transactionsType ? 1 : 0,
      "total": total,
      "description": description,
    };
  }

  int getTotalAll() {
    int total = 0;
    for (var fiat in fiats) {
      total += fiat.getFiatTotal();
    }
    return total;
  }
}

// void main() {
//   Fiatmodel fiatModel200 = Fiatmodel(package: 2, ref: 65, type: 200);
//   Fiatmodel fiatModel100 = Fiatmodel(package: 1, ref: 75, type: 100);
//   Moneymodel money = Moneymodel(
//       id: 1,
//       createdDate: "createdDate",
//       fiats: [fiatModel100, fiatModel200],
//       total: 70500);

//   print(money.getTotalAll() == money.total);
// }
