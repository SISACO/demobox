import 'package:donobox/screens/auth/sign.dart';
import 'package:donobox/screens/home/home.dart';
import 'package:donobox/screens/splash/splash.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'DonoBox',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.white,
        ),
      ),
      home:const SplashScreen(),
    );
  }
}
