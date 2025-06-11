import 'package:ecommerce_flutter/Scaffold_First.dart';
import 'package:ecommerce_flutter/Scaffold_Second.dart';
import 'package:ecommerce_flutter/screens/Branches_Screen.dart';
import 'package:ecommerce_flutter/screens/Cart_Screen.dart';
import 'package:ecommerce_flutter/screens/Category_Screen.dart';
import 'package:ecommerce_flutter/screens/Favorites_Screen.dart';
import 'package:ecommerce_flutter/screens/Home_Screen.dart';
import 'package:ecommerce_flutter/screens/Introduction_Screen.dart';
import 'package:ecommerce_flutter/screens/Login_Screen.dart';
import 'package:ecommerce_flutter/screens/Product_Screen.dart';
import 'package:ecommerce_flutter/screens/Promocode_Screen.dart';
import 'package:ecommerce_flutter/screens/Settings_Screen.dart';
import 'package:ecommerce_flutter/screens/SignUp_Screen.dart';
import 'package:ecommerce_flutter/screens/Transaction_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroductionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
