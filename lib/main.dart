import 'package:flutter/material.dart';

import 'screens/splash_screen/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayurvedic Clinc',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
        
      ),
      debugShowCheckedModeBanner: false,
      home: ScreenSplash(),
    );
  }
}


