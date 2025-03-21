// using an abstract class here
abstract class CounterEvent{}

// Both our events extend from CounterEvent - which is the class that is used in counter_bloc.dart.
class CounterIncrement extends CounterEvent{}
class CounterDecrement extends CounterEvent{}
class CounterReset extends CounterEvent{}