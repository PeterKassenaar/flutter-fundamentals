import 'package:flutter/material.dart';
import '../models/City.dart'; // update path for your situation

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

  // We call this function for *each city* and it returns a Card widget with the
  // properties of the city inside.
  // A separate function is often more readable than all inline code.
  Widget cityTemplate(City city) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(city.name,
                style: TextStyle(fontSize: 18, color: Colors.grey[800])),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  '${city.country}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                // *Conditional rendering* of a part of the widget tree.
                // Note the (weird, IMO) notation of  ...[] if we want to group multiple Widgets.
                // It is called the Spread-operator.
                if (city.population != -1) ...[
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '(${city.population})',
                    style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                  )
                ]
              ],
            )
          ],
        ),
      ),
    );
  }

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
          // We now call the cityTemplate function, which returns a Card() widget.
          // The current city is passed in as a parameter
          children: cities.map((city) => cityTemplate(city)).toList(),
        )
    );
  }
}
