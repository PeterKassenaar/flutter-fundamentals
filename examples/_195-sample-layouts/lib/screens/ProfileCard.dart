// ProfileCard.dart - A sample Social Media Profile Card.
// We now hardcoded the text into the Card, but in the future of course
// this can come from a database.
// We also created a helper function `buildTextRow` that returns a widget
// to be used in the main body of the ProfileCard.
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Profile Card'),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      // The body of the Profile Card. Wrap the Card() widget inside
      // a Center() widget if you also want to center it vertically.
      body: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(40.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/yoshi.png'),
              ),
              SizedBox(height: 16),
              // Because we are building the same text row twice in this sample,
              // we created a function for this (see below).
              // The function should
              // returns a Column() widget, containing Text() widgets, in which
              // the parameters are placed. Of course this is not required, but
              // by using a function `buildTextRow()`, we are more flexible.
              buildTextRow("NAME:", "Yoshi", Colors.amber),
              SizedBox(height: 8),
              buildTextRow("CUTENESS LEVEL:", "7", Colors.amber),
              SizedBox(height: 16),
              Divider(color: Colors.white30),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email, color: Colors.white70),
                  SizedBox(width: 8),
                  Text(
                    "yoshi@nintendo.com",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build the rows for Name and Cuteness Level in the Profile Card.
  // Not mandatory, but avoids repeating yourself.
  Widget buildTextRow(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 14)),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
