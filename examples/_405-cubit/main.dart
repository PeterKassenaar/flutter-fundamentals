// main.dart - the startup file
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Our custom cubit logic
import '../cubit/counter_cubit.dart';

// Our screen, holding the counter UI
import 'screens/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1. Even when using Cubits, we need a MultiBlocProvider() or BlocProvider(),
      // to create the context. Only this time it is based on CounterCubit(), not on CounterBloc().
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit())
        ],
        child: const CounterPage(), // CounterPage has acces to all state in CounterCubit() class
      ),
      title: 'Cubit Counter Example',
    );
  }
}
