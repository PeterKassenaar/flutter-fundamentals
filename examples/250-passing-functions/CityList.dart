import 'package:flutter/material.dart';
import 'package:first_flutter_app/model/City.dart';

// import the extracted widget and (re)use it in the list
import 'package:first_flutter_app/widgets/CityCard.dart';

class CityList extends StatefulWidget {
  @override
  _CityListState createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  // Our list is now an array of City objects (not just strings anymore).
  /// We need to compose the instances correctly.
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
          // We now call the CityCard custom widget directly.
          // The current city is passed in as a parameter
          children: cities.map((city) => CityCard(
              city: city,
              delete: (){
                // inline function. It CAN be in its own function
                setState(() {
                  print('removing city: ' + city.name);
                  cities.remove(city);
                });
              }
          )
          ).toList(),
        ));
  }
}
