import 'package:flutter/material.dart';

class Fiatmodel {
  int ref;
  final int type;
  final Color color;

  Fiatmodel({
    required this.ref,
    required this.type,
    required this.color,
  });

  factory Fiatmodel.fromJson(Map<String, dynamic> json) {
    // print(Color(json["color"]));
    return Fiatmodel(
      ref: json["ref"],
      type: json["type"],
      color: Color(json["color"]),
      // Color(int.parse(json["color"])),
    );
  }

  Map<String, dynamic> toJson() {
    // print(color.hashCode);
    return {
      "ref": ref,
      "type": type,
      "color": color.value,
    };
  }

  int getFiatTotal() {
    return ref * type;
  }
}

// void main() {
//   Fiatmodel fiatModel100 = Fiatmodel(package: 2, ref: 65, type: 200);
//   print(fiatModel100.getFiatTotal());
// }
