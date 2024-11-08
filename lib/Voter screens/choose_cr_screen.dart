import 'package:electra_sphere/Voter%20screens/successfully_voted.dart';
import 'package:electra_sphere/Voter%20screens/widgets/choose_cr_widget.dart';
import 'package:electra_sphere/Voter%20screens/widgets/drawer_page.dart';
import 'package:electra_sphere/common%20Screens/notification_page.dart';
import 'package:flutter/material.dart';

class ChooseCRScreen extends StatelessWidget {
  const ChooseCRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffE76239),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text('Vote your C.R.')),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationsScreen()),
              );
            },
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      drawer: const DrawerPage(),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.03, // Adjust vertical padding
          horizontal: screenWidth * 0.04, // Adjust horizontal padding
        ),
        margin: EdgeInsets.symmetric(
          vertical: screenHeight * 0.05, // Adjust vertical margin
          horizontal: screenWidth * 0.08, // Adjust horizontal margin
        ),
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          children: [
            Text(
              "Select Your Class Representative",
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize:
                    screenWidth * 0.06, // Adjust font size for responsiveness
                fontWeight: FontWeight.w500,
              ),
            ),
            const ChooseCRWidget(),
            Container(
              margin: EdgeInsets.only(
                  bottom: screenHeight * 0.03), // Adjust bottom margin
              height: screenHeight * 0.08, // Adjust height
              width: screenWidth * 0.5, // Adjust width
              decoration: BoxDecoration(
                color: const Color(0xffEEEEEE).withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessfullyVotedScreen(),
                    ),
                    (route) =>
                        false, // This removes all previous routes, preventing back navigation
                  );
                },
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      color: Color(0xffE76239),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
