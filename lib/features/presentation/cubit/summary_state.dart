import '../../data/models/money_model.dart';
import '../../data/models/summary_model.dart';

final class SummaryState {}

final class SummaryInitial extends SummaryState {}

final class SummaryLoading extends SummaryState {}

final class SummaryLoaded extends SummaryState {
  final SummaryModel transactions;

  SummaryLoaded({required this.transactions});
}
