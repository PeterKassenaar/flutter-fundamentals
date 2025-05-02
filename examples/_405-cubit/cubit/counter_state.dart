// counter_state.dart
// A simple class, holding the current state, in this case an integer.
class CounterState {
  final int count;

  CounterState(this.count);

  // Factory constructor for the initial state.
  // We MUST provide an initial state. This is the value that the
  // state has before the emit() function is called.
  factory CounterState.initial() => CounterState(0);
}