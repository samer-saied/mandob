import 'package:bloc/bloc.dart';

import '../../../core/database/cache/sqlite_helper.dart';
import '../../data/models/summary_model.dart';
import 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit() : super(SummaryInitial());

  DateTime? startDate = null;

  Future<void> getTodaySummaryReports() async {
    emit(SummaryLoading());
    SummaryModel transactions = await DatabaseHelper.queryTodayTransactions();

    emit(SummaryLoaded(transactions: transactions));
  }

  Future<void> getWeeklySummaryReports() async {
    emit(SummaryLoading());
    SummaryModel transactions = await DatabaseHelper.queryPeriodTransactions(
        startDate!, DateTime.now().add(const Duration(days: 1)));

    emit(SummaryLoaded(transactions: transactions));
  }

  Future<void> deleteTransaction(int id) async {
    await DatabaseHelper.deleteData(id);
    getTodaySummaryReports();
  }

  changeDate(DateTime startDate) {
    emit(ChangeDateLoading());

    this.startDate = startDate;
    emit(ChangeDateLoaded(date: startDate));
  }
}
