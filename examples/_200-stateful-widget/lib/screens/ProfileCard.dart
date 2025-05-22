import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  // define cutenessLevel as a double, b/c the slider wants a double as input value
  double cutenessLevel = 0.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(10),
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Profile Card',
              style: TextStyle(
                  color: Colors.white
              )
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[800],
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The Circle Avatar with Yoshi
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/yoshi-avatar.png'),
                  radius: 45.0,
                  backgroundColor: Colors.white,
                ),
              ),
              Divider(height: 60.0, color: Colors.white60),
              // Label for the name
              Text(
                'NAME:',
                style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
              ),
              // a SizedBox() widget, to create an (invisible) box between
              // the two Text widgets - just to give them some space
              SizedBox(height: 10.0),
              // The actual Name
              Text(
                'Yoshi',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              // Box to divide the name labels/fields
              SizedBox(height: 30.0),
              // Label for Cuteness level
              Text(
                'CUTENESS LEVEL:',
                style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
              ),
              SizedBox(height: 10.0),
              // The actual Name
              Text(
                "Level: $cutenessLevel",
                // convert and display the double as an integer
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 10.0),
              // Slider theme, to show a label above the Slider.
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  showValueIndicator: ShowValueIndicator.always,
                ),
                // The actual Slider
                child: Slider(
                  value: cutenessLevel,
                  min: 0,
                  max: 10,
                  label: cutenessLevel.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      cutenessLevel = value.floorToDouble();
                    });
                  },
                ),
              ),
              SizedBox(height: 10.0),
              // A row, b/c we want to display widgets next to each other
              Row(
                children: <Widget>[
                  // Again a SizedBox() to give the widgets a little space in between.
                  // We are now using the width property
                  Icon(Icons.email, color: Colors.grey[200]),
                  SizedBox(width: 10.0),
                  Text(
                    'yoshi@nintendo.com',
                    style: TextStyle(
                      color: Colors.grey[400],
                      letterSpacing: 2.0,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
