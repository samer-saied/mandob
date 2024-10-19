import 'package:bloc/bloc.dart';

import '../../../core/database/cache/sqlite_helper.dart';
import '../../data/models/money_model.dart';
import 'summary_state.dart';

class SummaryCubit extends Cubit<SummaryState> {
  SummaryCubit() : super(SummaryInitial());

  Future<void> getAllSummaryReports() async {
    emit(SummaryLoading());
    List<Moneymodel> transactions = await DatabaseHelper.queryTransactions();
    emit(SummaryLoaded(transactions: transactions));
  }
}
