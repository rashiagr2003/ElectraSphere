import 'package:flutter/material.dart';

class SuccessfullyVotedScreen extends StatelessWidget {
  const SuccessfullyVotedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight * 0.02, // Adjust top padding proportionally
          bottom: screenHeight * 0.01, // Adjust bottom padding proportionally
          left: screenWidth * 0.03, // Adjust left padding proportionally
          right: screenWidth * 0.03, // Adjust right padding proportionally
        ),
        child: SizedBox(
          height: screenHeight, // Ensure the image covers the full height
          width: screenWidth, // Ensure the image covers the full width
          child: const Image(
            image: AssetImage("assets/confirmation_screen.png"),
            fit: BoxFit
                .cover, // Use BoxFit.cover to maintain the aspect ratio and fill the screen
          ),
        ),
      ),
    );
  }
}
