import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
        home: Scaffold(
          appBar: AppBar(
          title: new Text('Hello Flutter'),
            centerTitle: true,
            backgroundColor: Colors.green[800],
          ),
          body: Center(
            child: Text(
              'This is my Flutter app',
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
            backgroundColor: Colors.green[800],
            child: Text('click'),
          ),
      )
    )
  );
}
