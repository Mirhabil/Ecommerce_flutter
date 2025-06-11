import 'dart:ffi';

import 'package:ecommerce_flutter/Scaffold_Second.dart';
import 'package:ecommerce_flutter/screens/Introduction_Screen.dart';
import 'package:ecommerce_flutter/screens/Login_Screen.dart';
import 'package:ecommerce_flutter/screens/SignUp_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldFirst extends StatefulWidget {
  const ScaffoldFirst({super.key});

  @override
  State<ScaffoldFirst> createState() => _ScaffoldFirstState();
}

class _ScaffoldFirstState extends State<ScaffoldFirst> {
  int currentPage = 0;

  List<Widget> introScreens = [
    IntroductionScreen(),
    LoginScreen(),
    SignUpScreen(),
  ];

  void goToNextPage() {
    if (currentPage < introScreens.length) {
      currentPage++;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScaffoldSecond()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: introScreens[0]);
  }
}
