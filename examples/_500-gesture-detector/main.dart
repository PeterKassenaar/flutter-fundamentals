import 'package:flutter/material.dart';
import 'package:flutter_example/screens/gesture_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExampleGestureDetector() // search for countries using a TextField()
    );
  }
}
