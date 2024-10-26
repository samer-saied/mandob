import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../cubit/summary_cubit.dart';
import '../cubit/summary_state.dart';
import '../widgets/report_header_widget.dart';
import '../widgets/trasaction_row_widget.dart';

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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
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
                                    child: TrasactionRow(
                                      index: index,
                                      moneyTransaction: state
                                          .transactions.transactions[index],
                                    ));
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
