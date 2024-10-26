import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../core/utils/app_colors.dart';
import '../cubit/add_cubit.dart';
import '../cubit/add_state.dart';

class MoneyRow extends StatelessWidget {
  final int index;
  final bool diabled;
  const MoneyRow({super.key, required this.index, this.diabled = false});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(symbol: "");

    //('#,###');
    // final formattedNumber = formatter.format(fiat.getFiatTotal());

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //////// fiat Widget with x sign  example: 200 X
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: context
                        .read<AddCubit>()
                        .money
                        .fiats[index]
                        .color
                        .withOpacity(0.25),
                  ),
                  height: 50,
                  child: Center(
                    child: Text(
                      context
                          .read<AddCubit>()
                          .money
                          .fiats[index]
                          .type
                          .toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'X',
                  style: TextStyle(
                    fontSize: 18,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        // //////// Secand Package FormField Widget
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 50,
            child: Center(
              child: BlocBuilder<AddCubit, AddState>(
                builder: (context, state) {
                  return TextField(
                    enabled: !diabled,
                    controller: context.read<AddCubit>().controllers[index],
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: AppColors.grey,
                      )),
                      enabledBorder: UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onTap: () =>
                        context.read<AddCubit>().controllers[index].selection =
                            TextSelection(
                                baseOffset: 0,
                                extentOffset: context
                                    .read<AddCubit>()
                                    .controllers[index]
                                    .value
                                    .text
                                    .length),
                    onChanged: (val) {
                      if (val.isEmpty) {
                        context.read<AddCubit>().editTransaction(index, 0);
                      } else {
                        context
                            .read<AddCubit>()
                            .editTransaction(index, int.parse(val));
                      }
                    },
                  );
                },
              ),
              // }
            ),
          ),
        ),

        //////// Total Widget with = sign  example: = 6,767.00
        Flexible(
          flex: 1,
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    '=',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                BlocBuilder<AddCubit, AddState>(
                  builder: (context, state) {
                    return Text(
                      formatter.format(int.parse(context
                                      .read<AddCubit>()
                                      .controllers[index]
                                      .text ==
                                  ""
                              ? "0"
                              : context
                                  .read<AddCubit>()
                                  .controllers[index]
                                  .text) *
                          context.read<AddCubit>().money.fiats[index].type),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
