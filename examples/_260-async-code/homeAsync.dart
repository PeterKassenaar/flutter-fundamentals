// home.dart - the Home Screen
import 'package:flutter/material.dart';

// Our own class, extending the base StatelessWidget class
class HomeAsync extends StatefulWidget {
  @override
  _HomeAsyncState createState() => _HomeAsyncState();
}

class _HomeAsyncState extends State<HomeAsync> {
  // 1. The data/state for our application
  String name = '';
  String occupation = '';
  String image = '';

  // 2. Lifecycle hook - it initializes our data
  @override
  void initState() {
    super.initState();
    getPerson();
    // 2a. We can also do that by setting the name, occupation and image
    // in separate functions (see 3a. and 3b.).
    // getName();
    // getOccupation();
  }

  // 3. Fill the variables.
  void getPerson() async {
    // Simulate 2 seconds delay, then continue
    name = await Future.delayed(Duration(seconds: 2), () {
      return 'mario';
    });

    // Simulate another second delay, then continue.
    // You do this for instance, if you have an operation that RELIES
    // on the outcome of the previous operation. By using async/await, you
    // are sure that the value is now available.
    occupation = await Future.delayed(Duration(seconds: 1), () {
      // IRL - do lookup for Mario, and find that he's a plumber.
      return 'Plumber, savior of princesses';
    });

    // set the state with the now retrieved values. This is after a total
    // of 3 seconds (when all Futures are resolved).
    setState(() {
      name;
      occupation;
      image = 'img/$name.png';
    });
  } // getPerson

  // 3a. Get (only) the name async
  void getName() async {
    // Simulate 3 seconds delay, then continue
    name = await Future.delayed(Duration(seconds: 3), () {
      return 'mario';
    });
    setState(() {
      name;
      image = 'img/$name.png';
    });
  }

  // 3a. Get (only) the occupation  async. We show a spinner icon
  // (see build() method) as long as the occupation Future is not resolved.
  void getOccupation() async {
    occupation = await Future.delayed(Duration(seconds: 6), () {
      return 'Plumber, savior of princesses';
    });
    setState(() {
      occupation;
    });
  }

  //****************** UI
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
                fontSize: 32,
                color: Colors.grey[600],
                letterSpacing: 2,
              ),
            ),
          ),
          // Display a spinner while `occupation` is loading, else show the occupation
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.lightBlue[200],
            child:
                occupation.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : Text(
                      occupation,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[600],
                        letterSpacing: 2,
                      ),
                    ),
          ),
          if (image != '') Expanded(child: Image.asset(image)),
        ],
      ),
    );
  }
}
