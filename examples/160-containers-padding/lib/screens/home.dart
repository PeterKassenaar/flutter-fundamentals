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
      // 1. Container Widget. A container can have a child and multiple properties
      body: Container(
        // A child, so the container will
        // only fill the childs background
        color: Colors.green[200],
        child: Text('Hello Container'),
        // Giving the container some margin and padding
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
      ),
      // 2. Padding as a 'standalone' widget
      // We can only use padding and child as properties. Nothing else.
      // body: Padding(
      //   padding: EdgeInsets.all(40.0),
      //   child: Text('Some text in a Padding() widget'),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[800],
        child: Text('click'),
      ),
    );
  }
}
