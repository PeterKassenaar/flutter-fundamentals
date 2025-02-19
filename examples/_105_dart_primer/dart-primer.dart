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
  print (p.sayHi()); // invoke method

  // 6. Sound null safety
  var i = 42; // Inferred to be an int.
  // i = null; // invalid!

  String? name3 = 'Alice'; // name3 MIGHT be assigned the value of null
  name3 = null; // valid

  // 8. Using enums, by calling a function (see below)
  showWarning();

  // 9. Collections - here, creating a List (e.g. an array)
  List<String> fruits = ['Apple', 'Pear', 'Banana'];
  for(var fruit in fruits){
    print(fruit);
  }
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
void showWarning(){
  LogLevel level = LogLevel.warning;
  String message = 'The log level is set to: ${level.name}';
  print (message);
}


