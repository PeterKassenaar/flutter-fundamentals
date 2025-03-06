// home.dart - the Home Screen
import 'package:flutter/material.dart';

// Our own class, extending the base StatelessWidget class
class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Hello Flutter'),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      // 1. Row Widget. A Row can have an ARRAY of children.
      // All children are widgets.
      body: Row(
        // 2. experiment with the alignment settings below
        // Details on axis alignment: https://api.flutter.dev/flutter/rendering/MainAxisAlignment.html and more.
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 3. experiment with more/less children in the <Widget>[]
          //..child 1
          FlutterLogo(),

          //..child 2
          Text('Hello World'),

          //..child 3
          ElevatedButton(
              onPressed: (){},
              child: Text('Click me')
          ),

          //..child 4
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Container in the row'),
            color: Colors.green[200],
          )
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
