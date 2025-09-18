import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/screens/about.dart';
import 'package:flutter_example/screens/countries/countries_favorites.dart';
import 'package:flutter_example/screens/navigationrail_example.dart';

// Import our bloc-elements
import 'screens/countries/bloc/countries_bloc.dart';
import 'screens/countries/bloc/countries_event.dart';

// Import the screens
import 'screens/countries/countries_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 1. This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Below: the `cascade` or `method chaining` operator, .. (two dots).
      // This operator allows you to perform multiple operations on the same
      // object without having to repeatedly reference that object.
      // It returns the original object, not the result of the method call.
      create: (context) => CountriesBloc()..add(FetchCountries()),
      child: MaterialApp(
        // 2. The Bottom navigation bar now holds the Scaffold() that wraps all pages/screens
        // 3. Replace with  home: const NavigationRailExample() if you want a NavigationRail for your navigation instead of a bottom bar.
        home: const BottomNavBar(),
      ),
    );
  }
}

// 4. The bottom navigation bar from the app, containing icons for the three screens.
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // start with the first icon selected.
  int _selectedIndex = 0;

  // A list with all possible pages from the app
  final List<Widget> _pages = [
    const CountriesHome(),
    const CountriesFavorites(),
    const AboutScreen(),
  ];

  // The user tapped a specific item in the bottom navigation bar.
  // Set its index in the state
  void _onNavigationItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // **************** UI of the BottomNavigationBar
  // Workshop: create a variable/list of all items in the navbar, instead of
  // coding them inline. Call a function with parameter to build the BottomNavigationBar().
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
          onTap: _onNavigationItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'About us'),
          ]),
    );
  }
}
