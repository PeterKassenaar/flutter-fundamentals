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
            onPressed: (){}, // Empty function (for now), as otherwise the application won't compile! 'onPressed()' is required for FAB.
            child: Text('click'),
          ),
      )
    )
  );
}
