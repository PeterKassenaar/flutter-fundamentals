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
      // 1. Row Widget. A Row can have an array of children. They are all widgets
      body: Row(
        // 2. experiment with the alignment settings below
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          // 3. experiment with more/less children in the <Widget>[]
          FlutterLogo(),
          Text('Hello World'),
          ElevatedButton(
              onPressed: (){},
              child: Text('Click me')
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Container'),
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
