// import the bloc package
import 'package:flutter_bloc/flutter_bloc.dart';

// import my events and (initial) state.
import 'counterEvent.dart';
import 'counterState.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrement>((event, emit) {
      emit(CounterState(state.count + 1)); // increment the counter
    });
    on<CounterDecrement>((event, emit) {
      emit(CounterState(state.count - 1)); // decrement the counter
    });
  }
}
