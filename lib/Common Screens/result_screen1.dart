import 'package:flutter/material.dart';

import 'result_screen2.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('CR Elections'),
        leading: Image.asset('assets/manipal_logo.png'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _navigateToResults,
          child: Text('View Results'),
        ),
      ),
    );
  }
}
