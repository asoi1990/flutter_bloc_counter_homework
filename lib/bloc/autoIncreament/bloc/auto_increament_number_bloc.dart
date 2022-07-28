import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auto_increament_number_event.dart';
part 'auto_increament_number_state.dart';

// class AutoIncreamentNumberBloc extends Bloc<AutoIncreamentNumberEvent, AutoIncreamentNumberState> {
//   AutoIncreamentNumberBloc() : super(AutoIncreamentNumberInitial()) {

//     on<AutoIncreamentNumberEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }

// Stream<int> get updatedNumber async *{
//       await Future<void>.delayed(Duration(seconds: 2));

//         for (int i = 1; i <= 10; i++) {
//           await Future<void>.delayed(Duration(seconds: 1));
//           emit(i);
//           yield i;
//         }
//     }
// }
class AutoIncreamentNumberBloc {
  int _flag = 0;
  int counter = 0;

  Stream<int> get updatedNumber async* {
    for (int i = 1;; i++) {
      if (_flag == 2) {
        await Future<void>.delayed(Duration(seconds: 1));
        if (_flag == 2 && counter == 0) i = 1;
        counter = i;
        yield counter;
      } else {
        await Future<void>.delayed(Duration(seconds: 1));
        yield counter;
      }
    }
  }

  stopStream() {
    _flag = 1;
  }

  startStream() {
    _flag = 2;
  }
}
