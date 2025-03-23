import 'package:electra_sphere/Candidature%20Screens/home_page.dart';
import 'package:flutter/material.dart';

class ClaimScreen extends StatefulWidget {
  final String name;
  const ClaimScreen({
    super.key,
    required this.name,
  });

  @override
  _ClaimScreenState createState() => _ClaimScreenState();
}

class _ClaimScreenState extends State<ClaimScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _promiseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontSizeFactor = screenWidth / 375;
    final paddingFactor = screenWidth / 375;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Claim',
          style: TextStyle(fontSize: 20 * fontSizeFactor, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16 * paddingFactor),
            child: Image.asset(
              'assets/manipal_logo.png', // Replace with your logo asset
              height: 40 * fontSizeFactor,
            ),
          ),
        ],
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
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8 * paddingFactor,
              horizontal: 16 * paddingFactor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome, ${widget.name}! 🎉",
                  style: TextStyle(
                    fontSize: 32 * fontSizeFactor,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),
                Card(
                  surfaceTintColor: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16 * paddingFactor),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Why should you be a C.R.? 🤔",
                            style: TextStyle(
                              fontSize: 20 * fontSizeFactor,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          TextFormField(
                            controller: _promiseController,
                            maxLines: 3,
                            validator: (input) {
                              if (input!.isEmpty) return 'Provide a promise';
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Your Promises',
                              hintText: 'Write what you promise to do...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            style: TextStyle(fontSize: 16 * fontSizeFactor),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          SizedBox(
                            width: screenWidth * 0.6,
                            height: screenHeight * 0.06,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orangeAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 5,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CandidatureHomePage(
                                        name: widget.name,
                                        promises: _promiseController.text,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Claim for C.R. 🚀',
                                style: TextStyle(
                                  fontSize: 18 * fontSizeFactor,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _promiseController.dispose();
    super.dispose();
  }
}
