import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hello Flutter!'), centerTitle: true),
        body: Center(child: Text('This is my Flutter app.')),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('click'),
        ),
      ),
    ),
  );
}
