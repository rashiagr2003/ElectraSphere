import 'dart:async';
import 'package:electra_sphere/choose_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 10 seconds
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChooseScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust font sizes proportionally based on screen size
    double titleFontSize = screenWidth * 0.08; // 8% of screen width
    double imageWidth = screenWidth * 0.5; // 50% of screen width
    double imageHeight = screenHeight * 0.1; // 10% of screen height

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Responsive Image size based on screen width and height
            Image.asset(
              'assets/vote_icon.jpg',
              width: imageWidth,
              height: imageHeight,
            ),
            const SizedBox(
              height: 16,
            ),
            // Responsive Text size
            Text(
              'ElectraSphere',
              style: TextStyle(
                fontSize: titleFontSize, // Responsive font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
