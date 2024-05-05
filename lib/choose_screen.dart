import 'package:electra_sphere/Voter%20screens/choose_cr_screen.dart';
import 'package:electra_sphere/Common%20Screens/notification_page.dart';
import 'package:electra_sphere/Admin%20screens/sign_up.dart';
import 'package:flutter/material.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({super.key});

  @override
  _ChooseScreenState createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  var _role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'ElectraSphere',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
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
                  'Welcome!',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffE76239)),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                  title: const Text('Candidature',
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
                                  builder: (context) => const SignUpScreen()));
                        } else if (_role == 'voter') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChooseCRScreen()));
                        } else if (_role == 'elective') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationsScreen()));
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
