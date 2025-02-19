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
        // 1. A simple ElevatedButton with some styling. Also see TextButton, OutlinedButton
          child: ElevatedButton(
              onPressed: () {
                print(
                    'You clicked the ElevatedButton'); // See IntelliJ-console!
              },
              child: Text('click me'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green[600])
          )
        // 2. An elevated icon button - notice the different properties
        // child: ElevatedButton.icon(
        //   onPressed: () {
        //     print('You clicked the Mail Icon Button');
        //   },
        //   icon: Icon(Icons.mail),
        //   label: Text('Mail me'),
        // )
        // 3. An IconButton is a pressable Icon.
        // child: IconButton(
        //   onPressed: () {
        //     print('you clicked the IconButton');
        //   },
        //   icon: Icon(Icons.alternate_email),
        //   color: Colors.green[600],
        //   iconSize: 100.0,
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[800],
        child: Text('click'),
      ),
    );
  }
}
