import 'package:bloc/bloc.dart';
import 'package:mandob_app/features/data/models/summary_model.dart';

import '../../../core/database/cache/sqlite_helper.dart';
import 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit() : super(SummaryInitial());

  Future<void> getTodaySummaryReports() async {
    emit(SummaryLoading());
    SummaryModel transactions = await DatabaseHelper.queryTodayTransactions();

    emit(SummaryLoaded(transactions: transactions));
  }

  Future<void> deleteTransaction(int id) async {
    await DatabaseHelper.deleteData(id);
    getTodaySummaryReports();
  }
}
