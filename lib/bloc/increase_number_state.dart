part of 'increase_number_bloc.dart';

enum Status { increaseStatus, decreaseStatus }

abstract class ChangingNumberState extends Equatable {
  int changingNumber;
  Status statusAction;

  ChangingNumberState(this.changingNumber, this.statusAction);

  @override
  List<Object> get props => [changingNumber];
}

class ManualState extends ChangingNumberState {
  ManualState(int number, Status statusAction) : super(number, statusAction);
}

class AutoRunState extends ChangingNumberState {
  AutoRunState(int number, Status statusAction) : super(number, statusAction);
}
