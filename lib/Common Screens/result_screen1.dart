import 'package:electra_sphere/Common%20Screens/result_screen2.dart';
import 'package:flutter/material.dart';

class ResultScreen1 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ResultScreen1> {
  List<Map<String, dynamic>> crList = [
    {'name': 'C.R. 1', 'votes': 45},
    {'name': 'C.R. 2', 'votes': 60},
    {'name': 'C.R. 3', 'votes': 50},
  ];

  void _navigateToResults() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultsScreen(crList: crList)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('CR Elections',
            style: TextStyle(fontSize: screenWidth * 0.05)),
        leading: Image.asset(
          'assets/manipal_logo.png',
          width: screenWidth * 0.1, // Resize the logo based on screen size
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1), // Padding for the button
          child: ElevatedButton(
            onPressed: _navigateToResults,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02, horizontal: screenWidth * 0.2),
              textStyle: TextStyle(
                  fontSize: screenWidth *
                      0.04), // Scale the text size based on screen width
            ),
            child: Text('View Results'),
          ),
        ),
      ),
    );
  }
}
