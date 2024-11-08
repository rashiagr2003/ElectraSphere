import 'package:electra_sphere/Voter%20screens/choose_cr_screen.dart';
import 'package:electra_sphere/Voter%20screens/reset_password.dart';
import 'package:flutter/material.dart';

class VoterLoginScreen extends StatefulWidget {
  @override
  _VoterLoginScreenState createState() => _VoterLoginScreenState();
}

class _VoterLoginScreenState extends State<VoterLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      backgroundColor: const Color(0xffE76239),
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02, // Adjust vertical padding
          horizontal: screenWidth * 0.05, // Adjust horizontal padding
        ),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: screenWidth, // Set width relative to screen size
              height: screenHeight -
                  keyboardHeight, // Adjust height based on keyboard height
              child: Card(
                color: Colors.white, // Set background color of the card
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: screenHeight *
                              0.12, // Adjust height for "Welcome" text
                          width: screenWidth,
                          child: const Text(
                            "Welcome!",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          validator: (input) {
                            if (input!.isEmpty) return 'Provide an email';
                            return null;
                          },
                          decoration:
                              const InputDecoration(labelText: 'Outlook ID'),
                          onSaved: (input) => _emailController.text = input!,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          validator: (input) {
                            if (input!.isEmpty) return 'Provide a password';
                            return null;
                          },
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          onSaved: (input) => _passwordController.text = input!,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetPasswordScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: screenWidth *
                                  0.8, // Adjust width based on screen size
                              height: 60,
                              child: const Text(
                                'Forgot Password?',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.5, // Adjust width for button
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  // Perform login here
                                  String email = _emailController.text;
                                  String password = _passwordController.text;
                                  // Use email and password as needed
                                  if (email.endsWith("@muj.manipal.edu") &&
                                      password.length >= 8) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChooseCRScreen(),
                                      ),
                                      (route) =>
                                          false, // This removes all previous routes, preventing back navigation
                                    );
                                  } else {
                                    // Show error message if validation fails
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Invalid email or password',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                } else {
                                  // Show SnackBar for validation errors
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please fill in all fields correctly.',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                              child: const Text('Sign In'),
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
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
