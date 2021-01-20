import 'package:flutter/material.dart';

// Import the screens
import 'package:first_flutter_app/screens/homeCountries.dart';
import 'package:first_flutter_app/screens/countryDetail.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => CountriesHome(),
        '/detail': (context) => CountryDetail(),
      },
    )
);
