import 'package:flutter/material.dart';

class ColorMixer extends StatefulWidget {
  @override
  _ColorMixerState createState() => _ColorMixerState();
}

class _ColorMixerState extends State<ColorMixer> {
  // the RGB color variables
  int red = 255;
  int green = 0;
  int blue = 0;
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        elevation: 0,
        centerTitle: true,
        title: Text('Compose a color'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.red,
                    padding: EdgeInsets.all(10),
                    child: Text(red.toString()),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.green,
                    padding: EdgeInsets.all(10),
                    child: Text(green.toString()),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    padding: EdgeInsets.all(10),
                    child: Text(blue.toString()),
                  ),
                ),
              ],
            ),
            // Red slider
            Slider(
                value: red.toDouble(),
                min: 0,
                max: 255,
                label: red.toString(),
                onChanged: (double value) {
                  setState(() {
                    red = value.floor();
                  });
                }),
            // Green slider
            Slider(
                value: green.toDouble(),
                min: 0,
                max: 255,
                label: green.toString(),
                onChanged: (double value) {
                  setState(() {
                    green = value.floor();
                  });
                }),
            // Blue slider
            Slider(
                value: blue.toDouble(),
                min: 0,
                max: 255,
                label: blue.toString(),
                onChanged: (double value) {
                  setState(() {
                    blue = value.floor();
                  });
                }),
            Expanded(
              child: Container(
                color: Color.fromRGBO(red, green, blue, opacity),
                child: Text(
                  'Color...',
                  style: TextStyle(),
                ),
                alignment: Alignment.center,
              ),
            ),
            // Opacity slider
            Row(
              children: [
                Text('opacity:'),
                Expanded(
                  child: Slider(
                      value: opacity,
                      min: 0,
                      max: 1,
                      onChanged: (double value) {
                        setState(() {
                          opacity = value;
                        });
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
