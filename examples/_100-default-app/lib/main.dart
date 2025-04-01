import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Hello Flutter!'),
            centerTitle: true,
        ),
        body: Center(child: Text('This is my Flutter app.')),
        floatingActionButton: FloatingActionButton(
          onPressed: null, // no logic (yet) when pressing the button. The property is mandatory, however.
          child: Text('click'),
        ),
      ),
    ),
  );
}
