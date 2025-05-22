import 'package:flutter/material.dart';
import '../models/City.dart'; // update path for your situation
import '../widgets/CityCard.dart'; // The extracted widget

class CityList extends StatefulWidget {
  @override
  CityListState createState() => CityListState();
}

class CityListState extends State<CityList> {
  // Our list is now an array of City objects (not just strings anymore).
  /// We need to compose the instances correctly.
  List<City> cities = [
    City(id: 1, name: 'Amsterdam', country: 'NL', population: 1000000),
    City(id: 2, name: 'Berlin', country: 'GER'),
    City(id: 3, name: 'New York', country: 'USA', population: 15000000),
    City(id: 4, name: 'Sydney', country: 'AUS'),
    City(id: 5, name: 'Tokyo', country: 'JP', population: 1800000),
  ];

  // function to remove a city from the array
  void _deleteCity(City city){
    setState(() {
      cities.remove(city);
    });
  }

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
          // We now call the cityTemplate function, which returns a Card() widget.
          // The current city is passed in as a parameter
          children: cities.map((city) => CityCard(
            city: city,
            delete: _deleteCity
          )
          ).toList(),
        )
    );
  }
}

