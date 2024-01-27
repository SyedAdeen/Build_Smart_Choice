import 'dart:io';
//import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:sampleapp/First_Screen.dart';
import 'package:sampleapp/Profile.dart';
import 'package:sampleapp/Settings.dart';
import 'package:sampleapp/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: Platform.isIOS,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(
            255, 106, 135, 59), // Set the primary color to pink
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(
              username: 'Admin',
            ),
        '/home': (context) => const HomePage(
              username: '',
            ),
        '/logout': (context) =>
            const FirstScreen(), // Navigate to DoubleStory class
      },
    );
  }
}
