import 'package:flutter/material.dart';

class Fiatmodel {
  final int package;
  final int ref;
  final int type;
  final Color color;

  Fiatmodel({
    required this.package,
    required this.ref,
    required this.type,
    required this.color,
  });

  factory Fiatmodel.fromJson(Map<String, dynamic> json) {
    return Fiatmodel(
      package: json["package"],
      ref: json["ref"],
      type: json["type"],
      color: Color(int.parse(json["color"])),
    );
  }

  int getFiatTotal() {
    return ((package * 100) + ref) * type;
  }
}

// void main() {
//   Fiatmodel fiatModel100 = Fiatmodel(package: 2, ref: 65, type: 200);
//   print(fiatModel100.getFiatTotal());
// }
