import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
        home: Scaffold(
          appBar: AppBar(
          title: new Text('Hello Flutter'),
            centerTitle: true,
          ),
          body: Center(
            child: Text('This is my Flutter app')
        ),
          floatingActionButton: FloatingActionButton(
            child: Text('click'),
          ),
      )
    )
  );
}
