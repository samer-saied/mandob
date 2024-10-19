import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandob_app/core/routes/app_routes.dart';
import 'package:mandob_app/core/utils/app_colors.dart';
import 'package:mandob_app/features/presentation/cubit/add_cubit.dart';
import 'package:mandob_app/features/presentation/cubit/summary_cubit.dart';
import 'package:mandob_app/features/presentation/cubit/summary_state.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SummaryCubit>().getAllSummaryReports();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Summary",
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
              return state.transactions.isEmpty
                  ? const Center(
                      child: Text("No Transactions"),
                    )
                  : ListView.builder(
                      itemCount: state.transactions.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(state.transactions[index].id.toString()),
                          direction: DismissDirection.endToStart,
                          secondaryBackground: Container(
                            color: AppColors.red,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child:
                                      Icon(Icons.delete, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          background: const SizedBox(),
                          onDismissed: (val) {
                            context.read<AddCubit>().deleteTransaction(
                                state.transactions[index].id);
                          },
                          child: ListTile(
                            title: Text(state.transactions[index].description
                                .toString()
                                .toUpperCase()),
                            subtitle: Text(state.transactions[index].createdDate
                                .toString()),
                            leading:
                                Text(state.transactions[index].id.toString()),
                            trailing: Text(
                                "${state.transactions[index].transactionsType ? "+" : "-"} ${state.transactions[index].getTotalAll().toString()} "),
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.pushNamed(context, Routes.transaction,
                                  arguments: state.transactions[index]);
                            },
                          ),
                        );
                      });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}
