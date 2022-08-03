import 'package:flutter_application_1/bloc/increase_number_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('IncreaseNumberEven', () {
    final increaseNumberEvent = IncreaseNumberEvent('1');
    test('IncreaseNumberEven.inputStep should be 1', () {
      expect(increaseNumberEvent.step, '1');
    });
  });

  group('DecreaseNumberEvent', () {
    final decreaseNumberEvent = DecreaseNumberEvent('2');
    test('DecreaseNumberEvent.inputStep should be 2', () {
      expect(decreaseNumberEvent.step, '2');
    });
  });

  group('AutoStartNumberEvent', () {
    final autoStartNumberEvent = AutoStartNumberEvent('3');
    test('AutoStartNumberEvent.inputStep should be 3', () {
      expect(autoStartNumberEvent.step, '3');
    });
  });

  group('StopNumberEvent', () {
    final stopNumberEvent = StopNumberEvent('4');
    test('StopNumberEvent.inputStep should be 4', () {
      expect(stopNumberEvent.step, '4');
    });
  });
}
