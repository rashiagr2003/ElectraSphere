import 'package:electra_sphere/Admin%20screens/publish_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _outlookIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _departmentController = TextEditingController();
  bool _acceptTermsAndConditions = false;
  List<Map<String, dynamic>> crList = [
    {'name': 'C.R. 1', 'votes': 45},
    {'name': 'C.R. 2', 'votes': 60},
    {'name': 'C.R. 3', 'votes': 50},
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _outlookIdController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE76239),
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Card(
            surfaceTintColor: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration:
                                const InputDecoration(labelText: 'Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _outlookIdController,
                            decoration:
                                const InputDecoration(labelText: 'Outlook Id'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your email';
                              }

                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration:
                                const InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }

                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _confirmPasswordController,
                            decoration: const InputDecoration(
                                labelText: 'Confirm Password'),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _departmentController,
                            decoration:
                                const InputDecoration(labelText: 'Department'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: CheckboxListTile(
                              value: _acceptTermsAndConditions,
                              onChanged: (value) {
                                setState(() {
                                  _acceptTermsAndConditions = value!;
                                });
                              },
                              title: const Text(
                                  'I accept the terms and conditions'),
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: Colors.blue,
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_signUpFormKey.currentState!
                                              .validate() &&
                                          _acceptTermsAndConditions) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ResultsPublishScreen(
                                                        crList: crList)));
                                        // Sign up
                                      }
                                    },
                                    child: const Text('Sign Up'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Center(
                                      child: RichText(
                                        text: const TextSpan(
                                          text: 'Already have an account? ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Login',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
}
