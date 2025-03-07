import 'package:flutter/material.dart';

class PuppyList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // The array containing the puppy-details.
    // They are objects of <String, String> (e.g. "name": "Joakim"), wrapped
    // in a Map() inside a List(). More info:
    //  - https://api.flutter.dev/flutter/dart-core/Map/Map.html
    //  - https://api.flutter.dev/flutter/dart-core/List-class.html
    final List<Map<String, String>> puppies = [
      {"name": "Joakim", "desc": "Joakim is a nice fellow currently looking for a new home.", "image": "assets/puppy-1.jpg"},
      {"name": "Tommy", "desc": "Tommy loves balls, sticks, socks and your slippers.", "image": "assets/puppy-2.jpg"},
      {"name": "Chris", "desc": "Chris is a bit of a wild one, but has a heart of gold. He'll never let you down.", "image": "assets/puppy-3.jpg"},
      {"name": "Par", "desc": "Par started this puppy show and loves to play the bass guitar.", "image": "assets/puppy-4.jpg"},
      {"name": "Hannes", "desc": "Hannes is a beast, but a cute one. You'll never want to get in trouble with him.", "image": "assets/puppy-5.jpg"},
    ];

    // The default Scaffold() widget, containing all content
    return Scaffold(
      appBar: AppBar(
        title: Text('The Puppy List', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.brown[700],
        centerTitle: true,
      ),
      // the `body` is of type ListView()
      // See https://api.flutter.dev/flutter/widgets/ListView-class.html for details
      body: Container(
        color: Colors.brown[200],
        child: ListView.builder(
          itemCount: puppies.length,
          itemBuilder: (context, index) {
            final puppy = puppies[index];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  puppy["image"]!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                puppy["name"]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(puppy["desc"]!),
              trailing: Icon(Icons.more_vert),
            );
          },
        ),
      ),
      // The bar with icons at the bottom of the screen.
      // See https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html for details.
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown[400],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search puppy"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Contact"),
        ],
      ),
    );
  }
}
