import 'package:flutter/material.dart';

class ChooseCRWidget extends StatefulWidget {
  const ChooseCRWidget({super.key});

  @override
  State<ChooseCRWidget> createState() => _ChooseCRWidgetState();
}

class _ChooseCRWidgetState extends State<ChooseCRWidget> {
  List<String> _classRepresentative = ['Naman', 'Dhakad'];
  List<String> _promises = [
    'I will give my best ',
    'Try to maintain discipline'
  ];
  List<String> _selectedCR = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: ListView.builder(
        itemCount: _classRepresentative.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              // CheckboxListTile for selecting class representatives
              CheckboxListTile(
                title: Text(
                  _classRepresentative[index],
                  style: TextStyle(
                      fontSize: screenWidth * 0.045), // Responsive font size
                ),
                value: _selectedCR.contains(_classRepresentative[index]),
                onChanged: (value) {
                  setState(() {
                    if (value!) {
                      _selectedCR.add(_classRepresentative[index]);
                    } else {
                      _selectedCR.remove(_classRepresentative[index]);
                    }
                  });
                },
              ),

              // Promise container with responsive padding and width
              Container(
                padding:
                    EdgeInsets.all(screenWidth * 0.02), // Responsive padding
                color: Colors.black26,
                width: screenWidth * 0.7, // Responsive width
                child: Center(
                  child: Text(
                    _promises[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.04, // Responsive font size
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
