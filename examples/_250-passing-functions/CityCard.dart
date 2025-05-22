import 'package:flutter/material.dart';

import '../models/City.dart';
// The widget is now in its own file. It can be reused in the application

class CityCard extends StatelessWidget {
  // 1. Use the 'final' keyword to let Dart know the variable is not going to change inside this widget
  final City city;
  final Function(City city) delete; // use strong typing after Function() to make sure the *correct type* of function is passed. This is NOT mandatory. You can type just 'Function delete' if you want, but then you don't have compile-time checking of the function.

  // 2. Constructor - receiving the passed in city and assigning it to the local variable `city`.
  // It can not be null, hence the keyword `required`.
  CityCard({required this.city, required this.delete});

  // 3. The build() function that returns the actual Card() widget.
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              city.name,
              style: TextStyle(fontSize: 18, color: Colors.grey[800]),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text(
                  city.country,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                // *Conditional rendering* of a part of the widget tree.
                // Note the (weird, IMO) notation of  ...[] if we want to group multiple Widgets.
                // It is called the Spread-operator.
                if (city.population != -1) ...[
                  SizedBox(width: 10),
                  Text(
                    '(${city.population})',
                    style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                  ),
                ],
                // Button to delete the city
                IconButton(
                  onPressed: () => delete(city),
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
