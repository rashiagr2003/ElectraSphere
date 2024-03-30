import 'package:electra_sphere/screens/notification_page.dart';
import 'package:electra_sphere/screens/sign_up.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: const Text(
          'Welcome !',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Why are you here for?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                ListTile(
                  title: const Text('Admin',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal)),
                  leading: Radio(
                    value: 'admin',
                    groupValue: _role,
                    onChanged: (value) {
                      setState(() {
                        _role = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Voter',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal)),
                  leading: Radio(
                    value: 'voter',
                    groupValue: _role,
                    onChanged: (value) {
                      setState(() {
                        _role = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Elective',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.normal)),
                  leading: Radio(
                    value: 'elective',
                    groupValue: _role,
                    onChanged: (value) {
                      setState(() {
                        _role = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                // ignore: unnecessary_null_comparison
                onPressed: _role == null
                    ? null
                    : () {
                        if (_role == 'admin') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()));
                        } else if (_role == 'voter') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationsScreen()));
                        } else if (_role == 'elective') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationsScreen()));
                        }
                      },

                child: const Text('SUBMIT',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
