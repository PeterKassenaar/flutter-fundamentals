import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_state.dart';

class CounterPageRead extends StatefulWidget {
  const CounterPageRead({super.key});

  @override
  State<CounterPageRead> createState() => _CounterPageReadState();
}

// 1. Watch state changes of the CounterBloc.
// Easy and straightforward.
class _CounterPageReadState extends State<CounterPageRead> {
  @override
  Widget build(BuildContext context) {
    // We just want to *retrieve* the state in this widget, not update it
    // therefore, watch() the current CounterBloc
    final currentCounter = context.watch<CounterBloc>().state;

    // use the property 'count' on the watched state
    return Text('Reading from the state:: ${currentCounter.count}');
  }
}

// 2. Alternative: using BlocBuilder() as wrapper around Text()
// This is more complex, but also more flexible, as you can react to
// state changes for a specific bloc instead of the complete page.
// No Good <--> Bad, just another approach
/*class _CounterPageReadState extends State<CounterPageRead> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Text(
          'Reading from the state: ${state.count}',
          style: TextStyle(
            fontSize: 36,
            color: Colors.red,
            fontWeight: FontWeight.normal,
          ),
        );
      },
    );
  }
}*/
