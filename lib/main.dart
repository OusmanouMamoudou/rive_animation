import 'package:flutter/material.dart';
import 'package:rive_animation/utilis/const.dart'; // Importing constants
import 'package:rive_animation/screens/onboarding.dart'; // Importing onboarding screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Widget constructor

  // This widget is the root of your application.
  // Ce widget est la racine de votre application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rive Animation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple), // Defining color scheme
        useMaterial3: true, // Using Material 3 design
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border:
              kDefaultInputBorder, // Applying default input border Application du theme par defaut pour la bordure
          enabledBorder: kDefaultInputBorder,
          focusedBorder: kDefaultInputBorder,
        ),
      ),
      home: const Onboarding(), // Setting initial route to onboarding screen
    );
  }
}
