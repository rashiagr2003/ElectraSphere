import 'package:flutter/material.dart';

class AdminResetPasswordScreen extends StatefulWidget {
  @override
  _AdminResetPasswordScreenState createState() => _AdminResetPasswordScreenState();
}

class _AdminResetPasswordScreenState extends State<AdminResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffE76239),
      appBar: AppBar(
        title: const Text('Create your Password'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02, // Adjust vertical padding
          horizontal: screenWidth * 0.05, // Adjust horizontal padding
        ),
        child: Center(
          child: SizedBox(
            height: screenHeight * 0.6, // Adjust height relative to screen size
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
                          height: screenHeight *
                              0.12, // Adjust height for "Reset your Password" text
                          width: screenWidth,
                          child: const Text(
                            "Reset your Password!",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _emailController,
                          validator: (input) {
                            if (input!.isEmpty)
                              return 'Provide a correct email';
                            return null;
                          },
                          decoration:
                              const InputDecoration(labelText: 'Outlook ID'),
                          onSaved: (input) => _emailController.text = input!,
                        ),
                        SizedBox(
                          width: screenWidth *
                              0.5, // Adjust width of button based on screen size
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  String email = _emailController.text;
                                  // Use email as needed
                                  if (email.endsWith("@muj.manipal.edu")) {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => ChooseCRScreen(),
                                    //   ),
                                    // );
                                  }
                                }
                              },
                              child: const Text('Verify'),
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
    super.dispose();
  }
}
