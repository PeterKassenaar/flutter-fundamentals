class City {
  // when using Option 1, we NEED the keyword `late`, because of null-safety in Dart.
  // We then ensure Dart that the properties will not remain null.
  // When using option 1 (witht the keyword `required`) we can omit the `late` keyword.
  int id;
  String name;
  String country;
  int population;

  // Option 1: constructor of our class - more verbose, not recommended anymore
  // City(int id, String name, String country, int population) {
  //   this.id = id;
  //   this.name = name;
  //   this.country = country;
  //   this.population = population;
  // }


  // Constructor, Option 2: using Named Parameters. Notice the {...} notation
  // When not using `late`, we HAVE to use `required` here, b/c the values may not be null.
  City({
    required this.id,
    required this.name,
    required this.country,
    this.population = -1});
}

// Instantiate when using option #1  City c = new City(1, 'Amsterdam', 'NH', 120000);
// Instantiate when using option #2  City c = new City(id: 1, name: 'Amsterdam', country: 'NL', population: 100000);
// the 'new' keyword is optional.
