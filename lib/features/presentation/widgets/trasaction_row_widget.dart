import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../data/models/money_model.dart';

class TrasactionRow extends StatelessWidget {
  final Moneymodel moneyTransaction;
  final int index;
  const TrasactionRow({
    super.key,
    required this.moneyTransaction,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.transaction,
            arguments: moneyTransaction);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.grey,
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: moneyTransaction.transactionsType
                      ? AppColors.primary
                      : AppColors.red,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  )),
              width: 20,
              height: 50,
              child: Center(
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(moneyTransaction.description.toString().toUpperCase()),
                    Text(moneyTransaction.createdDate.toString()),
                  ],
                ),
              ),
            ),
            Text(
                "${moneyTransaction.transactionsType ? "+" : "-"} ${moneyTransaction.getTotalAll().toString()} "),
          ],
        ),
      ),
    );
  }
}
