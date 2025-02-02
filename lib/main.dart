import 'package:flutter/material.dart';
import 'package:bmi/pages/splash_screen.dart';
void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      );
}