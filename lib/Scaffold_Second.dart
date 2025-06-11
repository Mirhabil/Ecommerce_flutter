import 'package:ecommerce_flutter/screens/Branches_Screen.dart';
import 'package:ecommerce_flutter/screens/Cart_Screen.dart';
import 'package:ecommerce_flutter/screens/Category_Screen.dart';
import 'package:ecommerce_flutter/screens/Favorites_Screen.dart';
import 'package:ecommerce_flutter/screens/Home_Screen.dart';
import 'package:ecommerce_flutter/screens/Introduction_Screen.dart';
import 'package:ecommerce_flutter/screens/Product_Screen.dart';
import 'package:ecommerce_flutter/screens/Promocode_Screen.dart';
import 'package:ecommerce_flutter/screens/Settings_Screen.dart';
import 'package:ecommerce_flutter/screens/Transaction_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaffoldSecond extends StatefulWidget {
  const ScaffoldSecond({super.key});

  @override
  State<ScaffoldSecond> createState() => _ScaffoldSecondState();
}

class _ScaffoldSecondState extends State<ScaffoldSecond> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        currentIndex: pageIndex,


        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/Vector.png",color: Colors.grey,),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Vector-1.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Vector-2.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Group 167.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/Vector-3.png", width: 23, height: 24),
            label: "",
          ),
        ],
      ),
      body: IndexedStack(
        index: pageIndex,
        children: [HomeScreen(),CategoryScreen(),ProductScreen(),FavoritesScreen(),SettingsScreen()],
      ),
    );
  }
}
