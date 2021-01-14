import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
              child: Image.asset('assets/woning.jpg')),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('NOS Nieuws'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    Text('Binnenland'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[900]
                      ),
                    ),
                    Text('12:24 uur',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey[900]
                      ),
                    ),
                  ],
                ),
                Text('Koopwoningen weer fors duurder. Een huis kost gemiddeld meer dan 350.000 euro.',
                  style: TextStyle(
                    fontSize: 24.0,
                    // letterSpacing: 2.0,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 10.0,),
                Text('Koopwoningen zijn in de maand oktober maar liefst 9,1 procent duurder geworden vergeleken met een jaar eerder. Dat is de grootste prijsstijging in bijna twee jaar. Een huis kost nu gemiddeld 350.244 euro, meldt het Centraal Bureau voor de Statistiek (CBS) vrijdag.',
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.5,
                ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Text('Home'),
      ),
    );
  }
}
