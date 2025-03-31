import 'package:flutter/material.dart';

// Example Gesture Detector.
// It wraps a custom button (formed from a Container()) with a
// GestureDetector() so the container responds to taps. On tapping
// the 'button', a SnackBar() is shown for a specific duration.
// See https://api.flutter.dev/flutter/widgets/GestureDetector-class.html for details.
class ExampleGestureDetector extends StatelessWidget {
  const ExampleGestureDetector({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. The text in the SnackBar()
    const snackbarText =
        'You tapped the custom button! (This message will disappear automatically)';
    return Scaffold(
      appBar: AppBar(
        title: new Text('Example Gesture Detector'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 2. Our GestureDetector wraps the custom button.
          Center(
            child: GestureDetector(
              // 3. When the child is tapped, show a snackbar.
              onTap: () {
                const snackBar = SnackBar(
                  content: Text(
                    snackbarText,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 2),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              // 4. Our custom button
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      // color of the shadow
                      offset: Offset(2, 2),
                      // horizontal and vertical offset for shadow
                      blurRadius: 6,
                      // softness of the shadow
                      spreadRadius:
                          2, // spreading the shadow (='how far around the button')
                    ),
                  ],
                ),
                child: const Text('Custom Button showing a SnackBar()'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
