import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/commons.dart';
import '../cubit/add_cubit.dart';
import '../cubit/add_state.dart';
import '../widgets/money_row_widget.dart';

import '../widgets/total_all_widget.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///
    ///
    ///
    ///
    final type = ModalRoute.of(context)!.settings.arguments as bool;

    ///
    ///
    ///

    return Scaffold(
      appBar: AppBar(
        backgroundColor: type ? AppColors.primary : AppColors.red,
        title: Text(
          type ? "+ Credit" : "- Debit",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AddCubit>().resetData();
            },
            icon: const Icon(
              Icons.cleaning_services_outlined,
              color: AppColors.white,
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ///////////////////////// FIATS LIST WIDGETS ///////////////////////////
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: context.read<AddCubit>().money.fiats.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: MoneyRow(
                          index: index,
                        ),
                      );
                    },
                  ),

                  /////////////////////////// TOTAL ///////////////////////////
                  BlocBuilder<AddCubit, AddState>(
                    builder: (context, state) {
                      return Center(
                        child: TotalAllWidget(
                          totalAllAmount:
                              context.read<AddCubit>().money.getTotalAll(),
                        ),
                      );
                    },
                  ),

                  /////////////////////////// Description ///////////////////////////
                  const Row(
                    children: [
                      Icon(
                        Icons.description_outlined,
                        color: Colors.grey,
                      ),
                      Text("Description :"),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: TextField(
                      // controller: TextEditingController(),
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (val) {
                        context.read<AddCubit>().money.description = val;
                      },
                    ),
                  ),

                  /////////////////////////// Details ///////////////////////////
                  Wrap(
                    children: [
                      const Icon(
                        Icons.timer_sharp,
                        color: Colors.grey,
                      ),
                      const Text("transaction Date:"),
                      Text(context
                          .read<AddCubit>()
                          .money
                          .createdDate
                          .toString()),
                    ],
                  ),
                  // Wrap(
                  //   children: [
                  //     const Icon(
                  //       Icons.create,
                  //       color: Colors.grey,
                  //     ),
                  //     const Text("edit Time:"),
                  //     Text(
                  //         context.read<AddCubit>().money.editedDate.toString()),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          type ? AppColors.primary : AppColors.red,
                        ),
                      ),
                      onPressed: () async {
                        context
                            .read<AddCubit>()
                            .addNewTransaction(type)
                            .then((val) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.intitlRoute,
                            (route) => false,
                          );

                          showToast(
                              message: "Transction Saved...",
                              state: ToastStates.success);
                        });
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
