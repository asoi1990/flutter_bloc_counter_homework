import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'increase_number_event.dart';
part 'increase_number_state.dart';

class ChangingNumberBloc
    extends Bloc<ChangingNumberEvent, ChangingNumberState> {
  ChangingNumberBloc() : super(ManualState(0, Status.increaseStatus)) {
    on<IncreaseNumberEvent>((event, emit) {
      int stepInput = valueInput(event.step);
      emit(
          ManualState(state.changingNumber + stepInput, Status.increaseStatus));
    });

    on<DecreaseNumberEvent>((event, emit) {
      int stepInput = valueInput(event.step);
      emit(
          ManualState(state.changingNumber - stepInput, Status.decreaseStatus));
    });

    on<AutoStartNumberEvent>((event, emit) {
      int stepInput = valueInput(event.step);
      emit(AutoRunState(state.changingNumber, state.statusAction));
      autoRun(stepInput);
    });

    on<StopNumberEvent>((event, emit) {
      emit(ManualState(state.changingNumber, state.statusAction));
    });
  }

  void autoRun(int step) async {
    while (state is AutoRunState) {
      if (state.statusAction == Status.increaseStatus) {
        emit(AutoRunState(state.changingNumber + step, state.statusAction));
      } else if (state.statusAction == Status.decreaseStatus) {
        emit(AutoRunState(state.changingNumber - step, state.statusAction));
      }
      await Future<void>.delayed(const Duration(seconds: 1));
    }
  }

  int valueInput(String valueInput) {
    if (int.tryParse(valueInput) != null) {
      return int.parse(valueInput);
    }
    return 0;
  }
}
