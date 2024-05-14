import 'package:electra_sphere/Candidature%20Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return Scaffold(
        backgroundColor: Color(0xffE76239),
        appBar: AppBar(
          title: Text('Claim'),
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 140,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                "Welcome                    Rashi !",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 35, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              child: TextFormField(
                                controller: _promiseController,
                                validator: (input) {
                                  if (input!.isEmpty)
                                    return 'Provide an promises';
                                  return null;
                                },
                                decoration:
                                    InputDecoration(labelText: 'Promises'),
                                onSaved: (input) =>
                                    _promiseController.text = input!,
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

                                      String promise = _promiseController.text;

                                      if (promise.isNotEmpty) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    CandidatureHomePage())));
                                      }
                                    }
                                  },
                                  child: Text('Claim For C.R.'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            )));
  }

  @override
  void dispose() {
    _promiseController.dispose();
    super.dispose();
  }
}
