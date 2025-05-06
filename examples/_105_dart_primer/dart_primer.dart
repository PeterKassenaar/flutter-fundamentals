void main() {
  // 1. will print a message in the console
  print("Hello World");

  // 2. Variable types are inferred, based on their initialization by using 'var'
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg',
  };

  // 3. You CAN be explicitly typed
  String name1 = 'Voyager I';
  int year1 = 1977;
  double antennaDiameter1 = 3.7;
  List flybyObjects1 = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  Map<String, Object> image1 = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg',
  };

  // 4. Dynamic types, use 'dynamic'
  dynamic name2 = "Bob";
  name2 = 12345; // valid.

  // 5. Create a person, based on a class  (see below)
  Person p = Person('Peter', 56, 'info@kassenaar.com');
  print(p.sayHi()); // invoke method

  // 6. Sound null safety
  var i = 42; // Inferred to be an int.
  // i = null; // invalid!

  String? name3 = 'Alice'; // name3 MIGHT be assigned the value of null
  name3 = null; // valid

  // 8. Using enums, by calling a function (see below)
  showWarning();

  // 9. Collections - here, creating a List (e.g. compare to JavaScript array).
  // A List is an ordered collections with zero-based indexing.
  List<String> fruits = ['Apple', 'Pear', 'Banana'];
  for (var fruit in fruits) {
    print(fruit);
  }

  // 10. Collections: Map
  Map<String, int> ages = {
    'Alice': 30,
    'Bob': 25,
    'Charlie': 40,
  };

  // Access items in a map
  print(ages['Alice']); // 30

  // Add item to a map
  ages['Dave'] = 28;

  // Iterate over map key/values
  ages.forEach((key, value) {
    print('$key is $value years old');
  });

  // Check existence of item in a Map
  print(ages.containsKey('Bob')); // true

  // Remove items from a Map
  ages.remove('Charlie');

  // Get keys and values
  print(ages.keys); // (Alice, Bob, Dave)
  print(ages.values); // (30, 25, 28)

  // 11. If you want the Values of a map to be anything/variable, annotate as this:
  Map<String, dynamic> persons = {
    'Alice': 30,
    'Bob': 'Engineer',
    'Charlie': {'age': 40, 'hobby': 'golf'}
  };


}

// Example of a Dart class
class Person {
  // class properties
  String firstName;
  int age;
  String email;

  // constructor
  Person(this.firstName, this.age, this.email);

  // method
  String sayHi() {
    return 'Hi, I am ${firstName}';
  }
}
// 7. Using imports
// Importing core libraries - These must be ON TOP OF THE FILE. NOT in a method (like void main()).
// import 'dart:math';

// Importing libraries from external packages
//   import 'package:test/test.dart';

// Importing files
//   import 'path/to/my_other_file.dart';

// 8. Enums, Defining the Enum
enum LogLevel { info, warning, error }

void showWarning() {
  LogLevel level = LogLevel.warning;
  String message = 'The log level is set to: ${level.name}';
  print(message);
}


