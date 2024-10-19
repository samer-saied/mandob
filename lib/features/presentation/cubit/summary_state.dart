import '../../data/models/money_model.dart';

final class SummaryState {}

final class SummaryInitial extends SummaryState {}

final class SummaryLoading extends SummaryState {}

final class SummaryLoaded extends SummaryState {
  final List<Moneymodel> transactions;

  SummaryLoaded({required this.transactions});
}
