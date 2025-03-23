import 'package:electra_sphere/Admin%20screens/login_screen.dart';
import 'package:electra_sphere/Candidature%20Screens/login_screen.dart';
import 'package:electra_sphere/Voter%20screens/login_screen.dart';
import 'package:flutter/material.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  _ChooseScreenState createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  String? _role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'ElectraSphere',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;

            // Define responsive font sizes
            double titleFontSize = screenWidth * 0.08;
            double subTitleFontSize = screenWidth * 0.06;
            double listTileFontSize = screenWidth * 0.05;
            double buttonFontSize = screenWidth * 0.05;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xffE76239),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        'Why are you here for?',
                        style: TextStyle(
                          fontSize: subTitleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      // Radio Buttons
                      _buildRoleOption('Admin', 'admin', listTileFontSize),
                      _buildRoleOption('Voter', 'voter', listTileFontSize),
                      _buildRoleOption(
                          'Candidature', 'elective', listTileFontSize),
                    ],
                  ),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _role == null ? null : _navigateToNextScreen,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.015,
                        ),
                      ),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontSize: buttonFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: screenHeight * 0.05), // Adjust bottom spacing
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Widget for building role options
  Widget _buildRoleOption(String title, String value, double fontSize) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: fontSize),
      ),
      leading: Radio<String>(
        value: value,
        groupValue: _role,
        onChanged: (value) {
          setState(() {
            _role = value;
          });
        },
      ),
    );
  }

  // Function to navigate based on selection
  void _navigateToNextScreen() {
    if (_role == 'admin') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AdminLoginScreen()));
    } else if (_role == 'voter') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => VoterLoginScreen()));
    } else if (_role == 'elective') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CandidatureLoginScreen()));
    }
  }
}
