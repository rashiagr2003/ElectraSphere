import 'package:electra_sphere/Candidature%20Screens/candidature_reset_password.dart';
import 'package:electra_sphere/Candidature%20Screens/home_page.dart';
import 'package:flutter/material.dart';


class CandidatureLoginScreen extends StatefulWidget {
  const CandidatureLoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CandidatureLoginScreenState createState() => _CandidatureLoginScreenState();
}

class _CandidatureLoginScreenState extends State<CandidatureLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffE76239),
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.04),
        child: Center(
          child: SizedBox(
            width: screenWidth * 0.9,
            height: screenHeight * 0.8,
            child: Card(
              surfaceTintColor: Colors.white,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: screenHeight * 0.15,
                          width: screenWidth * 0.8,
                          child: Text(
                            "Welcome!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: screenWidth * 0.08,
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
                          decoration: const InputDecoration(labelText: 'Outlook ID'),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TextFormField(
                          controller: _passwordController,
                          validator: (input) {
                            if (input!.isEmpty) return 'Provide a password';
                            return null;
                          },
                          decoration: const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CandidatureResetPasswordScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.05),
                          child: SizedBox(
                            width: screenWidth * 0.5,
                            height: screenHeight * 0.06,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  // Perform login here
                                  String email = _emailController.text;
                                  String password = _passwordController.text;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CandidatureHomePage(),
                                    ),
                                  );
                                  // Use email and password as needed
                                  if (email.endsWith("@muj.manipal.edu") && password.length == 8) {}
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
