// counter_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

// NOTE: No state (anymore, compared to bloc).
// Directly update the state in the methods.
// So, the counter logic now lives directly in the cubit methods.
// There is no 'on<T>()' event handler, but it still emits a new,
// updated CounterState.
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  // Increment the counter
  void increment() {
    emit(CounterState(state.count + 1));
  }

  // Decrement the counter
  void decrement() {
    emit(CounterState(state.count - 1));
  }

  // Workshop: implement a 'Reset' function to reset the counter to 0, using a cubit.
}
