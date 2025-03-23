import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.03,
              horizontal: screenWidth * 0.05,
            ),
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
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.1,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: Icon(Icons.person,
                      size: screenWidth * 0.1, color: Colors.white),
                ),
                SizedBox(height: screenHeight * 0.015),
                Text(
                  'John Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'john.doe@example.com',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                Text(
                  'Sec-IT-A',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth * 0.03,
              ),
              children: [
                _buildDrawerItem(
                  icon: Icons.person_outline,
                  text: "Profile",
                  screenWidth: screenWidth,
                  onTap: () {
                    // Navigate to profile screen
                  },
                ),
                _buildDrawerItem(
                  icon: Icons.settings_outlined,
                  text: "Settings",
                  screenWidth: screenWidth,
                  onTap: () {
                    // Navigate to settings screen
                  },
                ),
                const Divider(thickness: 1),
                _buildDrawerItem(
                  icon: Icons.logout,
                  text: "Log Out",
                  screenWidth: screenWidth,
                  color: Colors.redAccent,
                  onTap: () {
                    // Log out action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required double screenWidth,
    required VoidCallback onTap,
    Color color = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(icon, color: color, size: screenWidth * 0.06),
      title: Text(
        text,
        style: TextStyle(
          fontSize: screenWidth * 0.045,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      hoverColor: Colors.grey.withOpacity(0.1),
      onTap: onTap,
    );
  }
}
