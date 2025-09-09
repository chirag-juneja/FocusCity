import 'package:flutter/material.dart';

import 'package:focuscity/screens/home_screen.dart';

void main() {
  runApp(const FocusCityApp());
}

class FocusCityApp extends StatelessWidget {
  const FocusCityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Focus City",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
