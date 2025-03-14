import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/counterBloc.dart';
import 'screens/counterPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 1. Using MultiBlocProvider() here instead of BlocProvider(), as in bigger
      // applications you often need multiple providers, one for each piece of state.
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => CounterBloc())],
        child: const CounterPage(), // CounterPage now has acces to all state in CounterBloc() provider
      ),
    );
  }
}
