part of 'increase_number_bloc.dart';

abstract class ChangingNumberEvent extends Equatable {
  String step;
  ChangingNumberEvent(this.step);

  @override
  List<Object> get props => [];
}

class IncreaseNumberEvent extends ChangingNumberEvent {
  IncreaseNumberEvent(String inputStep) : super(inputStep);
}

class DecreaseNumberEvent extends ChangingNumberEvent {
  DecreaseNumberEvent(String inputStep) : super(inputStep);
}

class AutoStartNumberEvent extends ChangingNumberEvent {
  AutoStartNumberEvent(String inputStep) : super(inputStep);
}

class StopNumberEvent extends ChangingNumberEvent {
  StopNumberEvent(String inputStep) : super(inputStep);
}
