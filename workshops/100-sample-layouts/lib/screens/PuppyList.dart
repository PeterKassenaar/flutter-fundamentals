import 'package:flutter/material.dart';

class PuppyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[200],
        appBar: AppBar(
          title: Text('The Puppy List'),
          backgroundColor: Colors.brown[900],
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: [
              ListTile(
                leading: Image.asset('assets/puppy-1.jpg'),
                title: Text('Joakim'),
                subtitle: Text(
                    'Joakim is a nice fellow currently looking for a new home.'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
              ),
              Divider(
                height: 10,
              ),
              ListTile(
                leading: Image.asset('assets/puppy-2.jpg'),
                title: Text('Tommy'),
                subtitle:
                    Text('Tommy loves balls, sticks, socks and your slippers.'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
              ),
              Divider(
                height: 10,
              ),
              ListTile(
                leading: Image.asset('assets/puppy-3.jpg'),
                title: Text('Chris'),
                subtitle: Text(
                    'Chris is a bit of a wild one, but has a heart of gold. He\'ll never let you down.'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
              ),
              Divider(
                height: 10,
              ),
              ListTile(
                leading: Image.asset('assets/puppy-4.jpg'),
                title: Text('Par'),
                subtitle: Text(
                    'Par started this puppy show and loves to play the bass guitar.'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
              ),
              Divider(
                height: 10,
              ),
              ListTile(
                leading: Image.asset('assets/puppy-5.jpg'),
                title: Text('Hannes'),
                subtitle: Text(
                    'Hannes is a beast, but a cute one. You\'ll never want to get rid of him.'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
              ),
              Divider(
                height: 10,
              ),

            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.brown[400],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search puppy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page_outlined),
              label: 'Contact',
            ),
          ],
        ));
  }
}
