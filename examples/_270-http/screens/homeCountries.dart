// homeCountries.dart - the Home Screen
import 'package:flutter/material.dart';
import 'package:http/http.dart'; // to do http requests
import 'dart:convert'; // to convert response body to JSON objects/arrays

// Our own class, extending the base StatelessWidget class
class HomeCountries extends StatefulWidget {
  @override
  _HomeCountriesState createState() => _HomeCountriesState();
}

class _HomeCountriesState extends State<HomeCountries> {
  String url = 'https://restcountries.com/v3.1/all'; // The API we talk to
  String fields = '?fields=name,capital,flags'; // TODO: create a Model class for a country

  // 1. We're retrieving the country data from the Restful Countries API,
  // available on https://restcountries.eu/#api-endpoints-all.
  List countries = [];

  // 2. Lifecycle hook - it initializes our data.
  @override
  void initState() {
    super.initState();
    getCountries();
  }

  // 3. Get our (all) countries, using async/await notation
  void getCountries() async {
    // 3a. get the response, parse it as a `Uri` object.
    Response response = await get(Uri.parse(url + fields));

    // 3b. Check if all went allright
    if (response.statusCode == 200) {
      // Yes
      List jsonResponse = jsonDecode(response.body);
      print(jsonResponse[0]); // debugging only, see IntelliJ console. Don't forget to remove in production!
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
        title: new Text('All Countries'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        children: [
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
                          countries[index]['flags']['png'], // using the 'png' image from the response
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
                        // Optional: retrieve and use more properties
                        // Next up: adding onTap: to do something with the country,
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
