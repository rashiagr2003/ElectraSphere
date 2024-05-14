import 'package:electra_sphere/Candidature%20Screens/home_page.dart';
import 'package:electra_sphere/Voter%20screens/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CandidatureLoginScreen extends StatefulWidget {
  @override
  _CandidatureLoginScreenState createState() => _CandidatureLoginScreenState();
}

class _CandidatureLoginScreenState extends State<CandidatureLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE76239),
        appBar: AppBar(
          title: Text('Login Screen'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Welcome!",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextFormField(
                                controller: _emailController,
                                validator: (input) {
                                  if (input!.isEmpty) return 'Provide an email';
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: 'Outlook ID'),
                                onSaved: (input) =>
                                    _emailController.text = input!,
                              ),
                              TextFormField(
                                controller: _passwordController,
                                validator: (input) {
                                  if (input!.isEmpty)
                                    return 'Provide a password';
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: 'Password'),
                                obscureText: true,
                                onSaved: (input) =>
                                    _passwordController.text = input!,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResetPasswordScreen()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 60,
                                    child: Text(
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
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        // Perform login here
                                        String email = _emailController.text;
                                        String password =
                                            _passwordController.text;
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CandidatureHomePage()));
                                        // Use email and password as needed
                                        if (email
                                                .endsWith("@muj.manipal.edu") &&
                                            password.length == 8) {}
                                      }
                                    },
                                    child: Text('Sign In'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
            )));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
