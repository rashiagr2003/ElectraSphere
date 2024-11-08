import 'package:electra_sphere/Candidature%20Screens/home_page.dart';
import 'package:flutter/material.dart';

class ClaimScreen extends StatefulWidget {
  const ClaimScreen({super.key});

  @override
  _ClaimScreenState createState() => _ClaimScreenState();
}

class _ClaimScreenState extends State<ClaimScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _promiseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Define responsive scaling factors for font and spacing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontSizeFactor =
        screenWidth / 375; // Reference width: 375 for scaling
    final paddingFactor = screenWidth / 375;

    return Scaffold(
      backgroundColor: Color(0xffE76239),
      appBar: AppBar(
        title: Text('Claim', style: TextStyle(fontSize: 20 * fontSizeFactor)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8 * paddingFactor,
          horizontal: 16 * paddingFactor,
        ),
        child: Center(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight * 0.8,
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
                        height: 140 * fontSizeFactor,
                        width: screenWidth,
                        child: Text(
                          "Welcome                    Rashi !",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 35 * fontSizeFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100 * fontSizeFactor,
                        child: TextFormField(
                          controller: _promiseController,
                          validator: (input) {
                            if (input!.isEmpty) return 'Provide a promise';
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'Promises'),
                          onSaved: (input) => _promiseController.text = input!,
                          style: TextStyle(fontSize: 16 * fontSizeFactor),
                        ),
                      ),
                      SizedBox(
                        width: 180 * fontSizeFactor,
                        child: Padding(
                          padding: EdgeInsets.all(20 * paddingFactor),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                String promise = _promiseController.text;

                                if (promise.isNotEmpty) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CandidatureHomePage(),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text(
                              'Claim For C.R.',
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
    _promiseController.dispose();
    super.dispose();
  }
}
