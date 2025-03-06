import 'package:flutter/material.dart';

class PuppyList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> puppies = [
      {"name": "Joakim", "desc": "Joakim is a nice fellow currently looking for a new home.", "image": "assets/puppy-1.jpg"},
      {"name": "Tommy", "desc": "Tommy loves balls, sticks, socks and your slippers.", "image": "assets/puppy-2.jpg"},
      {"name": "Chris", "desc": "Chris is a bit of a wild one, but has a heart of gold. He'll never let you down.", "image": "assets/puppy-3.jpg"},
      {"name": "Par", "desc": "Par started this puppy show and loves to play the bass guitar.", "image": "assets/puppy-4.jpg"},
      {"name": "Hannes", "desc": "Hannes is a beast, but a cute one. You'll never want to get in trouble with him.", "image": "assets/puppy-5.jpg"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('The Puppy List', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.brown[700],
        centerTitle: true,
      ),
      body: ListView.builder(
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown[300],
        selectedItemColor: Colors.blue,
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
