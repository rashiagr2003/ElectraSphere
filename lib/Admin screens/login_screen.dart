import 'package:electra_sphere/Admin%20screens/publish_screen.dart';
import 'package:flutter/material.dart';

import 'reset_password.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _outlookIdController = TextEditingController();
  final _passwordController = TextEditingController();

  // Sample CR list that would come from your backend
  List<Map<String, dynamic>> crList = [
    {'name': 'C.R. 1', 'votes': 45},
    {'name': 'C.R. 2', 'votes': 60},
    {'name': 'C.R. 3', 'votes': 50},
  ];

  @override
  void dispose() {
    _outlookIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_loginFormKey.currentState!.validate()) {
      // Here you would typically verify credentials with your backend
      // For now, we'll just navigate to the results screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPublishScreen(crList: crList),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 360;
    final isLandscape = size.width > size.height;

    // Responsive spacing values
    final horizontalPadding = size.width * 0.05;
    final verticalPadding = size.height * 0.02;
    final buttonHeight = size.height * 0.06;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Election Login',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
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
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 600, // Maximum width for large screens
                ),
                child: Card(
                  surfaceTintColor: Colors.white,
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.04),
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // App logo or election graphic could go here
                          Icon(
                            Icons.how_to_vote,
                            size: isSmallScreen ? 60 : 80,
                            color: const Color(0xffE76239),
                          ),

                          SizedBox(height: verticalPadding * 2),

                          Text(
                            "Online Election System",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 18 : 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: verticalPadding * 2),

                          // Email/ID field with responsive font size
                          TextFormField(
                            controller: _outlookIdController,
                            decoration: InputDecoration(
                              labelText: 'Outlook ID',
                              hintText: 'Enter your institutional email',
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: verticalPadding,
                                horizontal: horizontalPadding * 0.5,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 14 : 16,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Outlook ID';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: verticalPadding * 1.5),

                          // Password field with responsive font size
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: verticalPadding,
                                horizontal: horizontalPadding * 0.5,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: isSmallScreen ? 14 : 16,
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: verticalPadding),

                          // "Forgot Password" text
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AdminResetPasswordScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 12 : 14,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: verticalPadding * 1.5),

                          // Login button with adaptive sizing
                          SizedBox(
                            height: buttonHeight,
                            child: ElevatedButton(
                              onPressed: _handleLogin,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffE76239),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 14 : 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: verticalPadding * 1.5),

                          // Help text
                          Text(
                            "If you're having trouble logging in, please contact your administrator.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isSmallScreen ? 12 : 14,
                              color: Colors.grey[600],
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
      ),
    );
  }
}
