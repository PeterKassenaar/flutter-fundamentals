import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hello Dart!'), centerTitle: true),
        body: Center(child: Text('This is the DART PRIMER app. See Console for output.')),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('click'),
        ),
      ),
    ),
  );
}
