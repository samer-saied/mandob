import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandob_app/core/routes/app_routes.dart';
import 'package:mandob_app/core/utils/app_colors.dart';
import 'package:mandob_app/features/presentation/cubit/summary_cubit.dart';
import 'package:mandob_app/features/presentation/cubit/summary_state.dart';

import '../../data/models/summary_model.dart';

class SummaryTodayPage extends StatelessWidget {
  const SummaryTodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SummaryCubit>().getTodaySummaryReports();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daily Summary",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: BlocBuilder<SummaryCubit, SummaryState>(
              builder: (context, state) {
            if (state is SummaryLoaded) {
              return state.transactions.transactions.isEmpty
                  ? const Center(
                      child: Text("No Transactions"),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          SummaryHeader(
                            summary: state.transactions,
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.transactions.transactions.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                  key: Key(state
                                      .transactions.transactions[index].id
                                      .toString()),
                                  direction: DismissDirection.endToStart,
                                  secondaryBackground: Container(
                                    color: AppColors.red,
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Icon(Icons.delete,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  background: const SizedBox(),
                                  onDismissed: (val) {
                                    context
                                        .read<SummaryCubit>()
                                        .deleteTransaction(state.transactions
                                            .transactions[index].id);
                                  },
                                  child: ListTile(
                                    title: Text(state.transactions
                                        .transactions[index].description
                                        .toString()
                                        .toUpperCase()),
                                    subtitle: Text(state.transactions
                                        .transactions[index].createdDate
                                        .toString()),
                                    leading: Text(state
                                        .transactions.transactions[index].id
                                        .toString()),
                                    trailing: Text(
                                        "${state.transactions.transactions[index].transactionsType ? "+" : "-"} ${state.transactions.transactions[index].getTotalAll().toString()} "),
                                    onTap: () {
                                      // Navigator.pop(context);
                                      Navigator.pushNamed(
                                          context, Routes.transaction,
                                          arguments: state.transactions
                                              .transactions[index]);
                                    },
                                  ),
                                );
                              }),
                        ],
                      ),
                    );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}
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
