class City {
  int id;
  String name;
  String country;
  int population;

  // Option 1: constructor of our class
  // City(int id, String name, String country, int population) {
  //   this.id = id;
  //   this.name = name;
  //   this.country = country;
  //   this.population = population;
  // }

  // Constructor, Option 2: using Named Parameters. Notice the {...} notation
  City({this.id, this.name, this.country, this.population = -1});
}

// Instantiate when using option #1  City c = new City(1, 'Amsterdam', 'NH', 120000);
// Instantiate when using option #2  City c = new City(id: 1, name: 'Amsterdam', country: 'NL', population: 100000);
// the 'new' keyword is optional.
