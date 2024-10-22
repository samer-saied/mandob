import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mandob_app/features/presentation/cubit/summary_state.dart';

import '../../../core/database/cache/sqlite_helper.dart';
import '../../data/models/fiat_model.dart';
import '../../data/models/money_model.dart';
import 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitialState());

  Moneymodel money = Moneymodel(
    id: 1,
    createdDate: DateTime.now(),
    fiats: [
      Fiatmodel(ref: 0, type: 200, color: Colors.amber),
      Fiatmodel(ref: 0, type: 100, color: Colors.grey),
      Fiatmodel(ref: 0, type: 50, color: Colors.red),
      Fiatmodel(ref: 0, type: 20, color: Colors.green),
      Fiatmodel(ref: 0, type: 10, color: Colors.brown),
      Fiatmodel(ref: 0, type: 5, color: Colors.blue),
      Fiatmodel(ref: 0, type: 1, color: Colors.yellow),
    ],
    total: 0,
    description: "",
  );

  late List<TextEditingController> controllers = [
    TextEditingController(text: money.fiats[0].ref.toString()),
    TextEditingController(text: money.fiats[1].ref.toString()),
    TextEditingController(text: money.fiats[2].ref.toString()),
    TextEditingController(text: money.fiats[3].ref.toString()),
    TextEditingController(text: money.fiats[4].ref.toString()),
    TextEditingController(text: money.fiats[5].ref.toString()),
    TextEditingController(text: money.fiats[6].ref.toString())
  ];

  editTransaction(int index, int newValue) {
    if (newValue == 0 || newValue.isNaN) {
      money.fiats[index].ref = 0;
    } else {
      money.fiats[index].ref = newValue;
    }
    emit(AddLoadedState(money: money));
  }

  Future<void> addNewTransaction(bool type) async {
    emit(AddLoadingState());
    money.transactionsType = type;
    await DatabaseHelper.insertOneTransaction(money);
    resetData();
    emit(AddLoadedState(money: money));
  }

  setHistoryTransaction(Moneymodel historyMoney) {
    emit(AddLoadingState());
    money = historyMoney;
    controllers = [
      TextEditingController(text: historyMoney.fiats[0].ref.toString()),
      TextEditingController(text: historyMoney.fiats[1].ref.toString()),
      TextEditingController(text: historyMoney.fiats[2].ref.toString()),
      TextEditingController(text: historyMoney.fiats[3].ref.toString()),
      TextEditingController(text: historyMoney.fiats[4].ref.toString()),
      TextEditingController(text: historyMoney.fiats[5].ref.toString()),
      TextEditingController(text: historyMoney.fiats[6].ref.toString())
    ];
    emit(AddLoadedState(money: money));
  }

  resetData() {
    emit(AddLoadingState());

    for (var element in money.fiats) {
      element.ref = 0;
    }
    for (var element in controllers) {
      element.text = "0";
    }

    emit(AddLoadedState(money: money));
  }
}
