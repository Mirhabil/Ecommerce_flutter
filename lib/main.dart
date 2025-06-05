import 'package:ecommerce_flutter/screens/Home_Screen.dart';
import 'package:ecommerce_flutter/screens/Introduction_Screen.dart';
import 'package:ecommerce_flutter/screens/Login_Screen.dart';
import 'package:ecommerce_flutter/screens/SignUp_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
