import 'package:electra_sphere/Candidature%20Screens/home_page.dart';
import 'package:flutter/material.dart';

class CandidatureResetPasswordScreen extends StatefulWidget {
  @override
  _CandidatureResetPasswordScreenState createState() =>
      _CandidatureResetPasswordScreenState();
}

class _CandidatureResetPasswordScreenState
    extends State<CandidatureResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE76239),
        appBar: AppBar(
          title: Text('Create your Password'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Center(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Card(
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Reset your Password!",
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              TextFormField(
                                controller: _emailController,
                                validator: (input) {
                                  if (input!.isEmpty)
                                    return 'Provide an correct email';
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: 'Outlook ID'),
                                onSaved: (input) =>
                                    _emailController.text = input!,
                              ),
                              SizedBox(
                                width: 180,
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      String email = _emailController.text;
                                      if (_formKey.currentState!.validate() ||
                                          email.endsWith("@muj.manipal.edu")) {
                                        _formKey.currentState!.save();
                                        // Perform login here
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CandidatureHomePage()));
                                      }
                                    },
                                    child: Text('Verify'),
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

    super.dispose();
  }
}
