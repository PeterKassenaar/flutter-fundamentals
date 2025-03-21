class CounterState {
  // 1. properties in our state
  final int count;
  final int numClicks;

  // 2. construct the state
  // CounterState(this.count);

  // 3. We can also add multiple values to the state of the counter:
  // like final int numClicks;
  // When using multiple values, provide initialization:
  CounterState({required this.count, required this.numClicks});

  // Optionally, create a factory function, to provide an initial state.
  // factory CounterState.initial() {
  //   return CounterState(count: 0, numClicks: 0); // default initialization
  // }
  //
  // Use this factory for instance in a calling widget as
  // CounterBloc() : super(CounterState.initial()) { ... }
}
