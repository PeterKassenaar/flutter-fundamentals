import 'package:flutter/material.dart';
import 'package:first_flutter_app/model/City.dart';

// The widget is now in its own file. It can be reused in the application
class CityCard extends StatelessWidget {
  // use the 'final' keyword to let Dart know the variable is not going to change inside this widget
  final City city;

  // constructor - receiving the passed in city.
  CityCard({this.city});

  @override
  Widget build(BuildContext context) {
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
                // conditional rendering of a part of the widget tree.
                // Note the (weird, IMO) notation of  ...[] if we want to group multiple Widgets
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
}
