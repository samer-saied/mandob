import '../../data/models/money_model.dart';

final class AddState {}

final class AddInitialState extends AddState {}

final class DeleteLoadingState extends AddState {}

final class DeleteLoadedState extends AddState {}

final class AddLoadingState extends AddState {}

final class AddLoadedState extends AddState {
  final Moneymodel money;

  AddLoadedState({required this.money});
}
