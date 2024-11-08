import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<String> notifications = [
    "New vote added Today",
    "New candidate nominated Yesterday",
    "Election results announced 05/09/2023",
    "New message from admin 01/09/2023",
    "Reminder: Submit your vote 31/08/2023",
    "New class rep appointed 31/08/2023",
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontSizeFactor = screenWidth / 375; // Reference width: 375
    final paddingFactor = screenWidth / 375;

    return Scaffold(
      backgroundColor: Color(0xffE76239),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontSize: 18 * fontSizeFactor),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: 8 * paddingFactor, horizontal: 16 * paddingFactor),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  notifications[index],
                  style: TextStyle(fontSize: 16 * fontSizeFactor),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Color(0xffE76239)),
                  onPressed: () {
                    setState(() {
                      notifications.removeAt(index);
                    });
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
