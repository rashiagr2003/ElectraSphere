import 'package:electra_sphere/Admin%20screens/publish_screen.dart';
import 'package:flutter/material.dart';
import 'package:electra_sphere/Voter%20screens/choose_cr_screen.dart';

import '../Common Screens/custom_appbar.dart';

class AdminResetPasswordScreen extends StatefulWidget {
  @override
  _AdminResetPasswordScreenState createState() =>
      _AdminResetPasswordScreenState();
}

class _AdminResetPasswordScreenState extends State<AdminResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  bool _isValidEmail = false;
  bool _isLoading = false;
  bool _showError = false; // Track when to show the error
  // Sample CR list that would come from your backend
  List<Map<String, dynamic>> crList = [
    {'name': 'C.R. 1', 'votes': 45},
    {'name': 'C.R. 2', 'votes': 60},
    {'name': 'C.R. 3', 'votes': 50},
  ];
  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _isValidEmail = _validateEmail(_emailController.text);
      });
    });
  }

  bool _validateEmail(String email) {
    return email.isNotEmpty && email.endsWith("@muj.manipal.edu");
  }

  void _onVerifyPressed() {
    setState(() {
      _showError = !_isValidEmail; // Show error only if email is invalid
    });

    if (_isValidEmail) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultsPublishScreen(crList: crList)),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Create your Password',
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange,
              Color(0xffE76239),
              Colors.orange, // End Color
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.05,
          ),
          child: Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: screenHeight * 0.6,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(2, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      AnimatedOpacity(
                        opacity: 1.0,
                        duration: Duration(seconds: 1),
                        child: SizedBox(
                          height: screenHeight * 0.1,
                          child: const Text(
                            "Reset your Password!",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (input) {
                          if (input == null || !_validateEmail(input)) {
                            return 'Enter a valid Outlook ID';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Outlook ID',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorText: _isValidEmail
                                ? null
                                : 'must end with @muj.manipal.edu'),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: _isValidEmail && !_isLoading
                                ? _onVerifyPressed
                                : null,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              backgroundColor:
                                  _isValidEmail ? Colors.white : Colors.grey,
                            ),
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text(
                                    'Verify',
                                    style: TextStyle(
                                        fontSize: 18, color: Color(0xffE76239)),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
