import 'package:flutter/material.dart';

class MyTextCopy extends StatefulWidget {
  const MyTextCopy({super.key});

  @override
  State<MyTextCopy> createState() => _MyTextCopyState();
}

class _MyTextCopyState extends State<MyTextCopy> {
  // Create a text editing controller
  final myController = TextEditingController();

  // The text variable to hold the copy. It is updated with setState(), below.
  var text = '';

  void initState() {
    super.initState();
    // listen for text changes by attaching the function that does the heavy lifting
    // to the controller
    myController.addListener(_printLatestValue);
  }

  void dispose() {
    super.dispose();
    // dispose the controller, to make sure no memory leaks
    myController.dispose();
  }

  // The main function that updates the text variable and prints current
  // text to the console for your reference.
  void _printLatestValue() {
    // helper variable
    final textInternal = myController.text;
    print(
      'Text field: $textInternal (${textInternal.characters.length})',
    );
    // Update the state, so the text on the page is updated.
    setState(() {
      text = myController.text;
    });
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: myController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Type something here',
              ),
            ),
            SizedBox(height: 10,),
            Text(
              text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
