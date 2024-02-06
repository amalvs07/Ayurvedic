import 'package:ayurvedic_clinic/provider/getPatientListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/splash_screen/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
 ChangeNotifierProvider(
          create: (_) => PatientListProvider(),
        ),
      ],
     
        child: MaterialApp(
          title: 'Ayurvedic Clinc',
          theme: ThemeData(
            fontFamily: 'Poppins',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
            useMaterial3: true,
            
          ),
          debugShowCheckedModeBanner: false,
          home: ScreenSplash(),
        ),
      
    );
  }
}


