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
          child: Text(
            'My First Flutter app - I am now a StatelessWidget',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.green[800],
                fontFamily: 'BungeeOutline'
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor:Colors.green[800],
        child: Text('click'),
      ),
    );
  }
}
