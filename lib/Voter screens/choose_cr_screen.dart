import 'package:electra_sphere/Voter%20screens/successfully_voted.dart';
import 'package:electra_sphere/Voter%20screens/widgets/choose_cr_widget.dart';
import 'package:electra_sphere/Voter%20screens/widgets/drawer_page.dart';
import 'package:electra_sphere/common%20Screens/notification_page.dart';
import 'package:flutter/material.dart';

class ChooseCRScreen extends StatefulWidget {
  const ChooseCRScreen({super.key});

  @override
  State<ChooseCRScreen> createState() => _ChooseCRScreenState();
}

class _ChooseCRScreenState extends State<ChooseCRScreen> {
  Set<String> _selectedCR = {}; // Keep track of selected CRs

  void _onSelectionChanged(Set<String> selected) {
    setState(() {
      _selectedCR = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Vote for Your C.R.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()),
              );
            },
            icon: const Icon(Icons.notifications, color: Colors.black),
          )
        ],
      ),
      drawer: const DrawerPage(),
      body: Container(
        width: double.infinity,
        height: double.infinity, // Maintains full height
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
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.03,
              horizontal: screenWidth * 0.06,
            ),
            margin: EdgeInsets.symmetric(
              vertical: screenHeight * 0.05,
              horizontal: screenWidth * 0.05,
            ),
            width: screenWidth * 0.9,
            height: screenHeight * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(3, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "Select Your Class Representative",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),

                // Candidates List
                Expanded(
                  child: ChooseCRWidget(
                    onSelectionChanged: _onSelectionChanged,
                    selectedCR: _selectedCR,
                  ),
                ),

                // Submit Button
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.only(bottom: screenHeight * 0.03),
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.6,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xffE76239), Color(0xffD14D2F)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        spreadRadius: 2,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessfullyVotedScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Center(
                      child: Text(
                        "Submit Vote",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
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
}
