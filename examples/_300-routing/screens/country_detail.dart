import 'package:flutter/material.dart';


class CountryDetail extends StatefulWidget {
  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {


  //************************* UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country details'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0,
      ),
      body: Column(
        children: [
          Text('TODO: Show country details....')
          // Next up: fetching details from the route and doing an additional request
          // to load specific country data.
        ],
      ),
    );
  }
}
