part of 'increase_number_bloc.dart';

abstract class ChangingNumberEvent extends Equatable {
  const ChangingNumberEvent();

  @override
  List<Object> get props => [];
}

class IncreaseNumberEvent extends ChangingNumberEvent {}

class DecreaseNumberEvent extends ChangingNumberEvent {}

// class AutoNumberEvent extends ChangingNumberEvent {}
