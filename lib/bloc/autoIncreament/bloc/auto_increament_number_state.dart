part of 'auto_increament_number_bloc.dart';

abstract class AutoIncreamentNumberState {
  final int changingNumber;

  const AutoIncreamentNumberState(this.changingNumber);

  @override
  List<Object> get props => [changingNumber];
}

class AutoIncreamentNumberInitial extends AutoIncreamentNumberState {
  AutoIncreamentNumberInitial(int number) : super(number);
}
