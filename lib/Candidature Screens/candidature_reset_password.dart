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
    // Define responsive scaling factors for font and spacing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontSizeFactor = screenWidth / 375; // Reference width: 375
    final paddingFactor = screenWidth / 375;

    return Scaffold(
      backgroundColor: Color(0xffE76239),
      appBar: AppBar(
        title: Text(
          'Create your Password',
          style: TextStyle(fontSize: 20 * fontSizeFactor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8 * paddingFactor,
          horizontal: 16 * paddingFactor,
        ),
        child: Center(
          child: SizedBox(
            height: screenHeight * 0.6,
            child: Card(
              surfaceTintColor: Colors.white,
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16 * paddingFactor),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100 * fontSizeFactor,
                        width: screenWidth,
                        child: Text(
                          "Reset your Password!",
                          style: TextStyle(
                            fontSize: 32 * fontSizeFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (input) {
                          if (input!.isEmpty) return 'Provide a correct email';
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Outlook ID'),
                        onSaved: (input) => _emailController.text = input!,
                        style: TextStyle(fontSize: 16 * fontSizeFactor),
                      ),
                      SizedBox(
                        width: 180 * fontSizeFactor,
                        child: Padding(
                          padding: EdgeInsets.all(30 * paddingFactor),
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
                                    builder: (context) => CandidatureHomePage(),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'Verify',
                              style: TextStyle(fontSize: 16 * fontSizeFactor),
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
