import 'package:flutter_application_1/bloc/increase_number_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('Manual state', () {
    final manualState = ManualState(2, Status.decreaseStatus);
    test('changingNumber value should be 2', () {
      expect(manualState.changingNumber, 2);
    });
    test('statusAction value should be decreaseStatus', () {
      expect(manualState.statusAction, Status.decreaseStatus);
    });

    test('statusAction value should be increaseStatus', () {
      manualState.statusAction = Status.increaseStatus;
      expect(manualState.statusAction, Status.increaseStatus);
    });
  });

  group('Auto run state', () {
    final autoRunState = AutoRunState(2, Status.decreaseStatus);
    test('changingNumber value should be 2', () {
      expect(autoRunState.changingNumber, 2);
    });
    test('statusAction value should be decreaseStatus', () {
      expect(autoRunState.statusAction, Status.decreaseStatus);
    });
    test('statusAction value should be increaseStatus', () {
      autoRunState.statusAction = Status.increaseStatus;
      expect(autoRunState.statusAction, Status.increaseStatus);
    });
  });
}
