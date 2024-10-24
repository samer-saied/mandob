import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../data/models/summary_model.dart';

//////////////////////////////////
///
///     Summary Header    ////////

class SummaryHeader extends StatelessWidget {
  final SummaryModel summary;
  const SummaryHeader({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.black.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Credit :",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.primary,
                      ),
                ),
                const Spacer(),
                Text(
                  "${summary.credits}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Debit :",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.red),
                ),
                const Spacer(),
                Text(
                  "${summary.debits * -1}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            Row(
              children: [
                Text(
                  "Balance :",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.black),
                ),
                const Spacer(),
                Text(
                  "${summary.credits - summary.debits}",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
