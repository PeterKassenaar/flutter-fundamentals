# Simple Data

This is a single file containing the techniques described in this module. 
Place it in a simple project and point to the main class from your `myApp()`.

For example:
````dart
import 'package:flutter/material.dart';
import 'package:flutter_example/screens/CityList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: CityList()
    );
  }
}
````