import 'package:flutter/material.dart';
import '../models/City.dart';

class CityList extends StatefulWidget {
  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  // Our list is now an array of City objects (not just strings anymore).
  // We need to compose the instances correctly.
  // In the future, of course the data comes from a 'real' database.
  List<City> cities = [
    City(id: 1, name: 'Amsterdam', country: 'NL', population: 1000000),
    City(id: 2, name: 'Berlin', country: 'GER'),
    City(id: 3, name: 'New York', country: 'USA', population: 15000000),
    City(id: 4, name: 'Sydney', country: 'AUS'),
    City(id: 5, name: 'Tokyo', country: 'JP', population: 1800000),
  ];

  @override
  Widget build(BuildContext context) {
    cities.map((e) => print(e));
    return Scaffold(
      appBar: AppBar(
        title: Text('List of cities'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey[500],
      ),
      body: Column(
        // We CAN use a ListView here, but as a demonstration, we'll use
        // the .map() function directly on a List.
        // Don't forget to cast the result with .toList() in the end, b/c
        // the property children should retrieve a list of widgets.
        children:
            cities
                .map((city) => Text('${city.name} - (${city.country})'))
                .toList(),
      ),
    );
  }
}
