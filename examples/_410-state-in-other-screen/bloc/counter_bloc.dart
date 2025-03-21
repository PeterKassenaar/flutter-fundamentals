// import the bloc package
import 'package:flutter_bloc/flutter_bloc.dart';

// import my events and (initial) state.
import 'counter_event.dart';
import 'counter_state.dart';

// This class is NOT a widget. It has no user interface. It only
// LISTENS to events and UPDATES the state. It therefore extends
// from 'CounterEvent' and 'CounterState'.
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // 1. Constructor,
  //   - setting up initial state
  //   - setting up listeners and updating the state.
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrement>((event, emit) {
      emit(
        CounterState(state.count + 1),
      ); // increment the counter
    });
    on<CounterDecrement>((event, emit) {
      emit(
        CounterState(state.count - 1),
      ); // decrement the counter
    });
    // Workshop: implement a 'Reset' function to reset the counter to 0.
  }

  // 2. When using multiple values, be sure to addres every value as a named parameter
  // CounterBloc() : super(CounterState(count: 0, numClicks: 0)) {
  //   on<CounterIncrement>((event, emit) {
  //     emit(
  //       CounterState(count: state.count + 1, numClicks: state.numClicks + 1),
  //     ); // increment the counter
  //   });
  //   on<CounterDecrement>((event, emit) {
  //     emit(
  //       CounterState(count: state.count - 1, numClicks: state.numClicks + 1),
  //     ); // decrement the counter
  //   });
  // }
}
