import 'package:flutter/material.dart';

class CityList extends StatefulWidget {
  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  List<String> cities = ['Amsterdam', 'Berlin', 'New York', 'Sidney', 'Tokyo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of cities'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey[500],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // We CAN use a ListView here, but as a demonstration, we'll use
        // the .map() function directly on a List.
        // The .map() casts a single city to a Container() widget, with the desired layout.
        // Experiment with other widgets like Center() and/or Padding() to change the layout.
        // Don't forget to cast the result with .toList() in the end, b/c
        // the property children should retrieve a list of widgets.
        children: cities.map((city) => Container(
          alignment: Alignment.centerLeft,
          child: Text(city,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 2, // double line height
              ),
          ),
        )
        ).toList(),
      ),
    );
  }
}
