import 'package:flutter/material.dart';

// 1. Import the (external) theme.
import 'theme.dart';

void main() {
  // Build custom theme data from theme.dart
  final theme = buildThemeData();

  runApp(
    MaterialApp(
      theme: theme, // Use the theme here!
      home: Scaffold(
        appBar: AppBar(
          title: new Text('Hello Flutter'), // rest of formatting will come from the theme.
        ),
        body: Center(
          child: Text(
            'This is my Flutter app',
            style: theme.textTheme.bodyMedium // Access textTheme directly from theme.
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('click'),
        ),
      ),
    ),
  );
}
