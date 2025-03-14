import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counterEvent.dart';
import '../bloc/counterBloc.dart';
import '../bloc/counterState.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // property counterBloc reads from the context, filled with CounterBloc (see
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: Text('Bloc Counter example')),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current count: ${state.count}',
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
              counterBloc.add(CounterIncrement());
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrement());
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
