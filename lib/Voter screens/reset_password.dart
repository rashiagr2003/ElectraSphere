import 'package:electra_sphere/Voter%20screens/choose_cr_screen.dart';
// import 'package:electra_sphere/Voter%20screens/successfully_voted.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChooseCRScreen()));
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        // Perform login here
                                        String email = _emailController.text;

                                        // Use email and password as needed
                                        if (email
                                            .endsWith("@muj.manipal.edu")) {}
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
