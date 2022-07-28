import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'increase_number_event.dart';
part 'increase_number_state.dart';

class ChangingNumberBloc
    extends Bloc<ChangingNumberEvent, ChangingNumberState> {
  ChangingNumberBloc() : super(IncreaseNumberInitial(0)) {
    on<IncreaseNumberEvent>((event, emit) {
      emit(IncreaseNumberInitial(state.changingNumber + 1));
    });

    on<DecreaseNumberEvent>((event, emit) {
      emit(DecreaseNumberInitial(state.changingNumber - 1));
    });

    // on<AutoNumberEvent>((event, emit) {
    //   Stream<int> generateNumbers = (() async* {
    //     await Future<void>.delayed(Duration(seconds: 2));

    //     for (int i = 1; i <= 10; i++) {
    //       await Future<void>.delayed(Duration(seconds: 1));
    //       emit(AutoNumberInitial(i));
    //       yield i;
    //     }
    //   })();
    // });
  }
}
