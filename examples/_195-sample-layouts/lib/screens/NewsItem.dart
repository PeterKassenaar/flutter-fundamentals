import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/funda_house.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16), // Indents the text content nicely
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "NOS NIEUWS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'BINNENLAND',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                    Text(
                      '12:24 uur',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Koopwoningen weer fors duurder. Een huis kost gemiddeld meer dan 350.000 euro.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Koopwoningen zijn in de maand oktober maar liefst 9,1 procent duurder geworden vergeleken met een jaar eerder. Dat is de grootste prijsstijging in bijna twee jaar. Een huis kost nu gemiddeld. 350.244 euro, meldt het Centraal Bureau voor de Statistiek (CBS) vrijdag.',
                  style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
    );
  }
}
