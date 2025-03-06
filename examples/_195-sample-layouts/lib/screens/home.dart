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
      // 1. Expanded Widget. Using flex inside Columns (and Rows)
      // An Expanded() element takes up as much space as is indicated by the flex: property
      body: Column(
        children: [
          // 2. Uncomment this Row to see the image *above* the containers, in its own Row,
          // Row(children: <Widget>[
          //   Expanded(child: Image.asset('assets/puppy-1.jpg')),
          // ]),
          SizedBox(height: 20.0),
          //*************************
          // Row 1: every container fills the complete space it is assigned by Expanded()
          // We have 3 containers, therefore every container takes up 33% of the screen
          //*************************
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.blueGrey,
                  child: Text('one'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.black26,
                  child: Text('two'),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.lightGreen,
                  child: Text('three'),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          //*************************
          // Row 2: using flex: the container takes up xx-times space relative to the other flex-containers.
          //*************************
          Row(
            children: <Widget>[
              Expanded(
                // 4. flex: represents the relative portion of this child, compared to the total
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.blueGrey,
                  child: Text('one'),
                ),
              ),
              Expanded(
                // 5. This container is half as wide as the one before.
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.black26,
                  child: Text('two'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.lightGreen,
                  child: Text('three'),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          //*************************
          // Row 3: The row now contains more childs. The rest of the containers still use flex:.
          //*************************
          Row(
            children: <Widget>[
              Expanded(
                // 3. The image is now inside the row in its own Expanded() widget. Try
                // what happens if you remove the Expanded() widget.
                child: Image.asset('assets/puppy-1.jpg'),
              ),
              Expanded(
                // 4. flex: represents the relative portion of this child, compared to the total
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.blueGrey,
                  child: Text('one'),
                ),
              ),
              Expanded(
                // 5. This container is half as wide as the one before.
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.black26,
                  child: Text('two'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Colors.lightGreen,
                  child: Text('three'),
                ),
              ),
            ],
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
