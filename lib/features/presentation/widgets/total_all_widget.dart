import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class TotalAllWidget extends StatelessWidget {
  final int totalAllAmount;
  const TotalAllWidget({
    super.key,
    required this.totalAllAmount,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(symbol: "EGP ");
    final formattedNumber = formatter.format(totalAllAmount);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        formattedNumber,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
