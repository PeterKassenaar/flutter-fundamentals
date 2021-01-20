// homeCountries.dart - the Home Screen
import 'package:flutter/material.dart';
import 'package:http/http.dart'; // to do http requests
import 'dart:convert'; // to convert response body to JSON objects/arrays
import 'package:flutter_svg/flutter_svg.dart'; //to handle .svg-images from the API

// Our own class, extending the base StatelessWidget class
class CountriesHome extends StatefulWidget {
  @override
  _CountriesHomeState createState() => _CountriesHomeState();
}

class _CountriesHomeState extends State<CountriesHome> {
  // variables in this Widget
  final textController = TextEditingController();
  String countryName = '';
  String url = 'https://restcountries.eu/rest/v2/name'; // The API we talk to
  String fields =
      '?fields=name;capital;flag'; // TODO: create a Model class for a country

  // 1. We're retrieving the country data from the Restful Countries API,
  // available on https://restcountries.eu/#api-endpoints-all.
  List countries = [];

  // 2. Lifecycle hook - it initializes our data.
  @override
  void initState() {
    // Do NOT get the countries upon loading this widget, but wait
    // until the user has entered a countryName in the text field.
  }

  // 3. Get countries starting with 'countryName'
  void getCountries(String countryName) async {
    // 3a. get the response
    Response response = await get('$url/$countryName$fields');

    // 3b. Check if all went allright
    if (response.statusCode == 200) {
      // Yes
      List jsonResponse = jsonDecode(response.body);
      setState(() {
        countries = jsonResponse;
      });
    } else if (response.statusCode == 404) {
      // No
      setState(() {
        countries = [
          {'name': 'error', 'capital': 'not found', 'flag': ''}
        ];
      });
    }
  }

  // ************************* UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Search Countries'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: textController,
                  decoration: InputDecoration(hintText: 'Search countries...'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Clear the selection
                    TextButton.icon(
                      icon: Icon(Icons.delete),
                      label: Text('Clear'),
                      onPressed: () {
                        setState(() {
                          countryName = '';
                          textController.text = '';
                          countries = []; // reset array with countries
                        });
                      },
                    ),
                    // Search for countries
                    TextButton.icon(
                      icon: Icon(Icons.search),
                      label: Text('Search'),
                      onPressed: () {
                        print(textController.text); // just to check
                        getCountries(textController.text);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: countries.length,
                  padding: EdgeInsets.all(10.0),
                  // 4. The function to build the items in the ListView
                  // See https://api.flutter.dev/flutter/widgets/ListView-class.html for more info
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: SvgPicture.network(
                              // using a 3rd party package here,
                              // as Flutter can't handle .svg-images (yet?).
                              countries[index]['flag'],
                              width: 64,
                            ),
                            title: Text(countries[index]['name']),
                            subtitle: Text(countries[index]['capital']),
                            // Option: retrieve and use more properties
                            onTap: () {
                              Navigator.pushNamed(context, '/detail');
                            },
                          )
                        ],
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
