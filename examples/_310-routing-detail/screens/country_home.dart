// homeCountries.dart - the Home Screen
import 'package:flutter/material.dart';
import 'package:http/http.dart'; // to do http requests
import 'dart:convert'; // to convert response body to JSON objects/arrays

// Our own class, extending the base StatelessWidget class
class CountriesHome extends StatefulWidget {
  @override
  _CountriesHomeState createState() => _CountriesHomeState();
}

class _CountriesHomeState extends State<CountriesHome> {
  // variables in this Widget
  final textController = TextEditingController();
  String countryName = ''; // The name of the country that will be typed in.
  String url = 'https://restcountries.com/v3.1/name'; // The API we talk to.
  String fields =
      '?fields=name,capital,flags'; // TODO: create a Model class for a country

  // 1. We're retrieving the country data from the Restful Countries API,
  // available on https://restcountries.eu/#api-endpoints-all.
  List countries = [];

  // 2. Lifecycle hook - initializes our data, but NOT USED in this example.
  @override
  void initState() {
    super.initState();
    // Do NOT get the countries upon loading this widget, but wait
    // until the user has entered a countryName in the text field.
    // The search is now performed when the user hits Enter or taps
    // the 'Search' button.
  }

  // 3. Get countries starting with 'countryName'
  void getCountries(String countryName) async {
    // 3a. get the response
    final apiUrl = '$url/$countryName$fields';
    Response response = await get(Uri.parse(apiUrl));

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
          {'name': 'error', 'capital': 'not found', 'flag': ''},
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
                // NEW: Textfield to type the name. It is bound to the textController, see above
                TextField(
                  controller: textController,
                  decoration: InputDecoration(hintText: 'Search countries...'),
                  onSubmitted: (String value) {
                    // Trigger the search when the Enter-key is pressed (on keyboard)
                    print(value); // debugging - show the value to search for
                    getCountries(value);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Clear the selection
                    TextButton.icon(
                      icon: Icon(Icons.delete),
                      label: Text('Clear'),
                      onPressed: () {
                        // reset all state
                        setState(() {
                          countryName = '';
                          textController.text = '';
                          countries = [];
                        });
                      },
                    ),
                    // Search for countries
                    TextButton.icon(
                      icon: Icon(Icons.search),
                      label: Text('Search'),
                      onPressed: () {
                        print(textController.text); // Debugging - just to check
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
                        leading: Image.network(
                          countries[index]['flags']['png'],
                          // using the 'png' image from the response
                          width: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Optional: Handle when the image can't load
                            return Icon(Icons.error, size: 50);
                          },
                        ),
                        title: Text(countries[index]['name']['common']),
                        subtitle: Text(
                          countries[index]['capital']?.first ??
                              'No capital found.',
                        ),
                        onTap: () {
                          // When clicking/tapping the country, go to the detail page.
                          Navigator.pushNamed(
                            context,
                            '/detail',
                            // Sending the name as an argument in the route!
                            arguments: {
                              'name': countries[index]['name']['common'],
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
