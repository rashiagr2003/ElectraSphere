import 'package:electra_sphere/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtil.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size to adjust responsive settings
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust font size proportionally for larger screens
    double titleFontSize =
        screenWidth * 0.08; // 8% of screen width for the title

    return MaterialApp(
      title: 'ElectraSphere', // Adjusted to be more relevant
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffE76239)),
        useMaterial3: true,
        // Global text theme for responsive scaling
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: titleFontSize, // Adjust font size globally
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const SplashScreen(), // Your initial splash screen
    );
  }
}
