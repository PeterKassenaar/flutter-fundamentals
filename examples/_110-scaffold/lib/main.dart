import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
        home: Scaffold(
          appBar: AppBar(
          title: new Text('Hello Flutter'),
            centerTitle: true,
          ),
          body: Center(child: Text('This is my Flutter app')),
          floatingActionButton: FloatingActionButton(
            onPressed: (){}, // Empty function (for now), as otherwise the application won't compile! 'onPressed()' is required for FAB.
            // if you place 'null' as its onPressed: property, the button is also disabled!
            child: Text('click'),
          ),
      )
    )
  );
}
