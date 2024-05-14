import 'package:flutter/material.dart';

class SuccessfullyVotedScreen extends StatelessWidget {
  const SuccessfullyVotedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 10, left: 5, right: 5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: const Image(
          image: AssetImage("assets/confirmation_screen.png"),
          fit: BoxFit.fill,
        ),
      ),
    ));
  }
}
