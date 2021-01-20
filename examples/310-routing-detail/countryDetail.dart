import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDetail extends StatefulWidget {
  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {

  // 0. Variables in this widget
  String url = 'https://restcountries.eu/rest/v2/name/';
  Map routingData = {};
  String countryName = '';
  List countries = [];

  // 1. Get the requested country async and assign it to countries
  // Note: this API *always* returns an array, even if only one country
  // is found. So we need List countries = []
  void getCountry(name) async {
    Response response = await get(url + name);
    if (response.statusCode == 200) {
      // just to check.
      print(response.body);
      setState(() {
        countries = jsonDecode(response.body);
      });
    } else {
      setState(() {
        countries = [
          {'name': 'Error', 'capital': 'Not found...'}
        ];
      });
    }
  }

  //************************* UI
  @override
  Widget build(BuildContext context) {

    // 2. Get the parameters from the router
    routingData = ModalRoute.of(context).settings.arguments;

    // 3. Check if there already is a country. If not, fetch it.
    countries.length == 0 ? getCountry(routingData['name']) : null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Country details'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: countries.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: SvgPicture.network(
                    countries[index]['flag'],
                    width: 240,
                  ),
                ),
                Divider(
                  height: 40,
                  color: Colors.blueGrey,
                ),
                Text(
                  'NAME:',
                  style: TextStyle(color: Colors.grey, letterSpacing: 2),
                ),
                SizedBox(height: 10),
                Text(countries[0]['name']),
                Text('(native: ${countries[0]['nativeName']})'),
                SizedBox(height: 20),
                Text(
                  'CAPITAL:',
                  style: TextStyle(color: Colors.grey, letterSpacing: 2),
                ),
                Text(countries[0]['capital']),
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
                  'CALLING CODE(S):',
                  style: TextStyle(color: Colors.grey, letterSpacing: 2),
                ),
                Text('${countries[0]['callingCodes']}'),
              ],
            );
          },
        ),
    );
  }
}
