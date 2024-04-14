import 'package:electra_sphere/screens/widgets/choose_cr_widget.dart';
import 'package:electra_sphere/screens/widgets/drawer_page.dart';
import 'package:flutter/material.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(child: Text('Vote your C.R.')),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          ],
        ),
        drawer: DrawerPage(),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Column(
            children: [
              const Text(
                "Select Your Class Representative",
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const ChooseCRWidget(),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                height: 60,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              )
            ],
          ),
        ));
  }
}
