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
      body: Center(
        // Network Image
        // child: Image(
        //   image: NetworkImage('https://images.unsplash.com/photo-1560807707-8cc77767d783?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=675&q=80')
        // )
        // Local Image - see also pubspec.yaml
        // child: Image(
        //   image: AssetImage('assets/puppy-3.jpg')
        // )
        // OR: simply use the image Shortcuts
        // child: Image.network(
        //     'https://images.unsplash.com/photo-1601979031925-424e53b6caaa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80'),
         child: Image.asset('assets/puppy-2.jpg'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[800],
        child: Text('click'),
      ),
    );
  }
}
