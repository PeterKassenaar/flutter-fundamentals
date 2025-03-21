class CounterState {
  // 1. properties in our state
  final int count;

  // 2. construct the state
  CounterState(this.count);

  // We can also add multiple values to the state of the counter:
  // final int numClicks;
  // When using multiple values, provide initialization:
  // CounterState({required this.count, required this.numClicks});
}
