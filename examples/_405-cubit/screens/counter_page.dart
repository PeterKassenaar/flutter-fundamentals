import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/counter_state.dart';
import '../cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // property counterCubit reads from the context, filled with CounterCubit()
    final counterCubit = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(title: Text('Cubit Counter example')),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'See source code for Cubit details. Note the absence of an `event` page.',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                ),
                Text(
                  'Current count from Cubit: ${state.count}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            );
          },
        ),
      ),
      // Column with Floating Action Buttons.
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Directly call the Cubit method, instead of .add() an event to the BLoc.
              counterCubit.increment();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              counterCubit.decrement();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
