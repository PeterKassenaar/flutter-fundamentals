import 'package:flutter/material.dart';

// Our homepage and detail page(s), used in navigation/routing.
import 'screens/country_home.dart';
import 'screens/country_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Now, we DON'T provide a home screen, but a routing table
      // instead, using 'initialRoute'. This in turn points to our
      // home screen.
      initialRoute: '/',
      routes: {
        '/': (context) => CountriesHome(),
        '/detail': (context) => CountryDetail(),
      },
    );
  }
}
