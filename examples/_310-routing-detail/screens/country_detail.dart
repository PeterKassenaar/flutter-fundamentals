import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class CountryDetail extends StatefulWidget {
  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  //************************* Logic in the detail component

  // 0. Variables in this widget
  String url = 'https://restcountries.com/v3.1/name/';
  var routingData = {}; // an object containing the countryname to search for.
  String countryName = ''; // a string in which we place the country name.
  List countries = []; // results. See below.

  // 1. Get the requested country async and assign it to countries[] List.
  // Note: this API *always* returns an array, even if only one country
  // is found. So we need List countries = [].
  // TODO: catch exceptions, show loading spinner, etc.
  void getCountry(name) async {
    final apiUrl = '$url$name';
    Response response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      // just to check.
      print(response.body);
      setState(() {
        countries = jsonDecode(response.body);
      });
    } else {
      setState(() {
        countries = [
          {'name': 'Error', 'capital': 'Not found...'},
        ];
      });
    }
  }

  //************************* UI
  @override
  Widget build(BuildContext context) {
    // 2. Get the parameters from the router, w/ explicit casting as Map<T,T>
    routingData =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;

    // 3. Check if there already is a country. If not, fetch it.
    countries.length == 0 ? getCountry(routingData['name']) : null;

    // 4. Return the UI
    return Scaffold(
      appBar: AppBar(
        title: Text('Country details'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: countries.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  countries[index]['flags']['png'],
                  // using the 'png' image from the response
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Optional: Handle when the image can't load
                    return Icon(Icons.error, size: 100);
                  },
                ),
              ),
              Divider(height: 40, color: Colors.blueGrey),
             Text(
                'NAME',
                style: TextStyle(color: Colors.grey, letterSpacing: 2),
              ),
              SizedBox(height: 10),
              Text(countries[0]['name']['common']),
              SizedBox(height: 20),
              Text(
                'CAPITAL:',
                style: TextStyle(color: Colors.grey, letterSpacing: 2),
              ),
              Text(countries[index]['capital']?.first ??
                  'No capital found.',),
              SizedBox(height: 20),
              Text(
                'POPULATION:',
                style: TextStyle(color: Colors.grey, letterSpacing: 2),
              ),
              Text(countries[0]['population'].toString()),
              SizedBox(height: 20),
              Text(
                'REGION:',
                style: TextStyle(color: Colors.grey, letterSpacing: 2),
              ),
              Text('${countries[0]['region']} /  ${countries[0]['subregion']}'),
              SizedBox(height: 20),
              Text(
                'BORDERS WITH:',
                style: TextStyle(color: Colors.grey, letterSpacing: 2),
              ),
              Text('${countries[0]['borders']}'),
            ],
          );
        },
      ),
    );
  }
}
