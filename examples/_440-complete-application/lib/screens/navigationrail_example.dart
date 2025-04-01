import 'package:flutter/material.dart';

// Import the screens
import 'countries/countries_home.dart';
import 'about.dart';
import 'countries/countries_favorites.dart';

// The NavigationRail-based navigation widget.
class NavigationRailExample extends StatefulWidget {
  const NavigationRailExample({super.key});

  @override
  State<NavigationRailExample> createState() => _NavigationRailExampleState();
}

class _NavigationRailExampleState extends State<NavigationRailExample> {
  // Start with the first item selected.
  int _selectedIndex = 0;

  // A list with all possible pages from the app
  final List<Widget> _pages = [
    const CountriesHome(),
    const CountriesFavorites(),
    const AboutScreen(),
  ];

  // The user selected an item in the navigation rail.
  // Update the state with the new index.
  void _onNavigationItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. When using a NavigationRail, use a Row() widget to lay out the navigation + content
      body: Row(
        children: [
          // 2. NavigationRail widget. It holds all the icons, similar to a BottomNavigationBar().
          // See for info and possible properties https://api.flutter.dev/flutter/material/NavigationRail-class.html#instance-properties
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onNavigationItemTapped,
            labelType: NavigationRailLabelType.all, // Show labels under icons
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                selectedIcon: Icon(Icons.home_outlined),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                selectedIcon: Icon(Icons.favorite_outline),
                label: Text('Favorites'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.info),
                selectedIcon: Icon(Icons.info_outline),
                label: Text('About us'),
              ),
            ],
          ),
          // A small vertical bar between the NavigationRail() and the content.
          VerticalDivider(width: 1, thickness: 1,),
          // 3. Expanded area to show the currently selected page.
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}