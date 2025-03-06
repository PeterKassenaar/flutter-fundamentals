// home.dart - the Home Screen
import 'package:flutter/material.dart';

// Our own class, extending the base StatelessWidget class
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Hello Flutter'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      // 1. Column Widget. A Column can also have an array of children. They are all widgets
      body: Column(
        // 2. Experiment with the alignment of the Column. Axises are now reversed!
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // children inside the Widget array. This is child 1.
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.blueGrey,
            child: Text('one'),
          ),

          //..child 2
          Container(
            padding: EdgeInsets.all(30.0),
            color: Colors.black26,
            child: Text('two'),
          ),

          //..child 3
          Container(
            padding: EdgeInsets.all(40.0),
            color: Colors.lightGreen,
            child: Text('three'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[800],
        child: Text('click'),
      ),
    );
  }
}
