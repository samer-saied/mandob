import 'fiat_model.dart';

class Moneymodel {
  final int id;
  final DateTime createdDate;
  final DateTime? editedDate;
  final List<Fiatmodel> fiats;
  final bool transactionsType;
  final double total;

  Moneymodel({
    required this.id,
    required this.createdDate,
    this.editedDate,
    required this.fiats,
    this.transactionsType = true,
    required this.total,
  });

  factory Moneymodel.fromJson(Map<String, dynamic> json) {
    return Moneymodel(
        id: json["id"],
        createdDate: json["createdDate"],
        editedDate: json["editedDate"],
        fiats: (json["fiats"] as List).map((fiat) {
          return Fiatmodel.fromJson(fiat);
        }).toList(),
        transactionsType: json["transactionsType"],
        total: json["total"]);
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
