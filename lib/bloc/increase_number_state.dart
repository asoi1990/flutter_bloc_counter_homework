part of 'increase_number_bloc.dart';

abstract class ChangingNumberState extends Equatable {
  int changingNumber;

  ChangingNumberState(this.changingNumber);

  @override
  List<Object> get props => [changingNumber];
}

class IncreaseNumberInitial extends ChangingNumberState {
  IncreaseNumberInitial(int number) : super(number);
}

class DecreaseNumberInitial extends ChangingNumberState {
  DecreaseNumberInitial(int number) : super(number);
}

// class AutoNumberInitial extends ChangingNumberState {
//   AutoNumberInitial(int number) : super(number);
// }
