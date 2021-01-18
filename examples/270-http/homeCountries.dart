// homeCountries.dart - the Home Screen
import 'package:flutter/material.dart';
import 'package:http/http.dart'; // to do http requests
import 'dart:convert'; // to convert response body to JSON objects/arrays
import 'package:flutter_svg/flutter_svg.dart'; //to handle .svg-images from the API

// Our own class, extending the base StatelessWidget class
class HomeCountries extends StatefulWidget {
  @override
  _HomeCountriesState createState() => _HomeCountriesState();
}

class _HomeCountriesState extends State<HomeCountries> {
  String url = 'https://restcountries.eu/rest/v2/all'; // The API we talk to
  String fields =
      '?fields=name;capital;flag'; // TODO: create a Model class for a country

  // 1. We're retrieving the country data from the Restful Countries API,
  // available on https://restcountries.eu/#api-endpoints-all.
  List countries = [];

  // 2. Lifecycle hook - it initializes our data.
  @override
  void initState() {
    getCountries();
  }

  // 3. Get our (all) countries
  void getCountries() async {
    // 3a. get the response
    Response response = await get(url + fields);

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
                            leading: SvgPicture.network(
                              // using a 3rd party package here,
                              // as Flutter can't handle .svg-images (yet?).
                              countries[index]['flag'],
                              width: 64,
                            ),
                            title: Text(countries[index]['name']),
                            subtitle: Text(countries[index]['capital']),
                            // Option: retrieve and use more properties
                            // Next up: adding onTap: to do something with the country,
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
