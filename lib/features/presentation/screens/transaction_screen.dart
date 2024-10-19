import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandob_app/core/utils/app_colors.dart';
import 'package:mandob_app/features/presentation/cubit/add_cubit.dart';

import '../../data/models/money_model.dart';
import '../widgets/money_row_widget.dart';
import '../widgets/total_all_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments as Moneymodel;
    context.read<AddCubit>().setHistoryTransaction(argument);

    ///
    ///
    ///
    ///
    final formatter = DateFormat('yyyy-MM-dd hh:mm');
    final formattedCreatedDate = formatter.format(argument.createdDate);
    formatter.format(argument.editedDate!);

    ///
    ///
    ///

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            argument.transactionsType ? AppColors.primary : AppColors.red,
        title: argument.transactionsType
            ? const Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              )
            : const Text(
                "Subtract",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<AddCubit>().resetData();
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   Routes.summary,
            //   (route) => false,
            // );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.white,
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: ListView(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: argument.fiats.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: MoneyRow(
                    index: index,
                    diabled: true,

                    ///
                    ///
                    ///
                    ///
                    ///
                  ),
                );
              },
            ),
            Center(
              child: TotalAllWidget(
                totalAllAmount: argument.getTotalAll(),
              ),
            ),
            Wrap(
              children: [
                const Icon(
                  Icons.description_outlined,
                  color: Colors.grey,
                ),
                Text(
                  "Description : ${argument.description}",
                ),
              ],
            ),
            Wrap(
              children: [
                const Icon(
                  Icons.timer_sharp,
                  color: Colors.grey,
                ),
                const Text("transaction Date:"),
                Text(formattedCreatedDate),
              ],
            ),
            // Wrap(
            //   children: [
            //     const Icon(
            //       Icons.create,
            //       color: Colors.grey,
            //     ),
            //     const Text("edit Time:"),
            //     Text(formattedEditedDate),
            //   ],
            // ),
            // // ElevatedButton(
            //   style: ButtonStyle(
            //     backgroundColor: WidgetStateProperty.all(Colors.blue),
            //   ),
            //   onPressed: () async {
            //     List<Moneymodel> transactions =
            //         await DatabaseHelper.queryTransactions();
            //     print(transactions.first.fiats.first.color);
            //   },
            //   child: const Text('Query Transaction'),
            // ),
          ],
        ),
      ),
    );
  }
}
