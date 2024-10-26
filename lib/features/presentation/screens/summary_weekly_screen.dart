import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../cubit/summary_cubit.dart';
import '../cubit/summary_state.dart';
import '../widgets/report_header_widget.dart';
import '../widgets/trasaction_row_widget.dart';

class SummaryWeeklyPage extends StatelessWidget {
  const SummaryWeeklyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // selectDate(context, DateTime(2024, 10, 24));
    // context.read<SummaryCubit>().getWeeklySummaryReports(DateTime(2024));
    // context.read<SummaryCubit>().getWeeklySummaryReports();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weekly Summary",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Wrap(
          children: [
            BlocBuilder<SummaryCubit, SummaryState>(builder: (context, state) {
              // if (state is! SummaryLoaded) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("Start Date : "),
                      ElevatedButton(onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (_) => Container(
                            color: AppColors.white,
                            height: 200,
                            width: MediaQuery.sizeOf(context).width,
                            child: CupertinoDatePicker(
                              initialDateTime: DateTime.now(),
                              minimumDate: DateTime(2024, 01, 01),
                              // maximumDate: DateTime(2024, 10, 24),
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (val) async {
                                await context
                                    .read<SummaryCubit>()
                                    .changeDate(val);
                              },
                            ),
                          ),
                        );
                      }, child: BlocBuilder<SummaryCubit, SummaryState>(
                        builder: (context, state) {
                          if (state is ChangeDateLoaded) {
                            return Text(state.date.toString().split(" ").first);
                          } else {
                            return const Text("Put your Start Date here");
                          }
                        },
                      )),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<SummaryCubit>().getWeeklySummaryReports();
                      },
                      child: const Text("Generate Report")),
                ],
              );
              // } else {
              //   return const SizedBox();
              // }
            }),
            BlocBuilder<SummaryCubit, SummaryState>(builder: (context, state) {
              if (state is SummaryLoaded) {
                return state.transactions.transactions.isEmpty
                    ? const Expanded(
                        child: Center(
                        child: Text(
                          '''No Transactions found \n use "Generate report" Button''',
                          textAlign: TextAlign.center,
                        ),
                      ))
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
                                itemCount:
                                    state.transactions.transactions.length,
                                itemBuilder: (context, index) {
                                  return TrasactionRow(
                                    index: index,
                                    moneyTransaction:
                                        state.transactions.transactions[index],
                                  );
                                }),
                          ],
                        ),
                      );
              } else {
                return const SizedBox();
                // return const Center(
                //   child: CircularProgressIndicator(),
                // );
              }
            }),
          ],
        ),
      ),
    );
  }
}
