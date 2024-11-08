import 'package:electra_sphere/Candidature%20Screens/cr_sign_up_screen.dart';
import 'package:electra_sphere/Admin%20screens/sign_up.dart';
import 'package:electra_sphere/Voter%20screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  _ChooseScreenState createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  var _role;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust font sizes proportionally based on screen size
    double titleFontSize = screenWidth * 0.08; // 8% of screen width
    double subTitleFontSize = screenWidth * 0.06; // 6% of screen width
    double listTileFontSize = screenWidth * 0.06; // 6% of screen width
    double buttonFontSize = screenWidth * 0.06; // 6% of screen width

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          'ElectraSphere',
          style: TextStyle(
            fontSize: titleFontSize, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Proportional padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: titleFontSize, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Color(0xffE76239),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04, // Adjust spacing
                ),
                Text(
                  'Why are you here for?',
                  style: TextStyle(
                    fontSize: subTitleFontSize, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02, // Adjust spacing
                ),
                // Radio buttons for role selection
                ListTile(
                  title: Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: listTileFontSize, // Responsive font size
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  leading: Radio(
                    value: 'admin',
                    groupValue: _role,
                    onChanged: (value) {
                      setState(() {
                        _role = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Voter',
                    style: TextStyle(
                      fontSize: listTileFontSize, // Responsive font size
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  leading: Radio(
                    value: 'voter',
                    groupValue: _role,
                    onChanged: (value) {
                      setState(() {
                        _role = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'Candidature',
                    style: TextStyle(
                      fontSize: listTileFontSize, // Responsive font size
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  leading: Radio(
                    value: 'elective',
                    groupValue: _role,
                    onChanged: (value) {
                      setState(() {
                        _role = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: _role == null
                    ? null
                    : () {
                        if (_role == 'admin') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        } else if (_role == 'voter') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VoterSignUpScreen(),
                            ),
                          );
                        } else if (_role == 'elective') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CRSignUpScreen(),
                            ),
                          );
                        }
                      },
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontSize: buttonFontSize, // Responsive font size
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1, // Adjust bottom spacing
            ),
          ],
        ),
      ),
    );
  }
}
