// home.dart - the Home Screen
import 'package:flutter/material.dart';

// Our own class, extending the base StatelessWidget class
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 1. The data/state for our application
  String name = '';
  String occupation = '';
  String image = '';

  // 2. Lifecycle hook - it initializes our data
  @override
  void initState() {
    getPerson();
  }

  // 3. Fill the variables. If we update them, we have to
  // use setState() of course.
  void getPerson() {
    name = 'mario';
    occupation = 'Plumber, savior of princesses';
    image = 'assets/$name.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Async operations'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.blue[200],
            child: Text(
              '$name',
              style: TextStyle(
                  fontSize: 32, color: Colors.grey[600], letterSpacing: 2),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.lightBlue[200],
            child: Text(
              '$occupation',
              style: TextStyle(
                  fontSize: 24, color: Colors.grey[600], letterSpacing: 2),
            ),
          ),
          if (image != '') Expanded(child: Image.asset(image))
        ],
      ),
    );
  }
}
