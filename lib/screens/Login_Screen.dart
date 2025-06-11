import 'package:ecommerce_flutter/Scaffold_Second.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Button.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Container.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 117),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle_rounded, size: 54),
                SizedBox(width: 31),
                Text(
                  "Logo",
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 44,
                    color: Color(0xFF434F67),
                  ),
                ),
              ],
            ),
            SizedBox(height: 69),
            CustomContainer(widthOfContainer: 323, heightOfContainer: 261, textFieldWidgetList: [
              CustomTextField.login("USERNAME", 54, false),
              CustomTextField.login("PASSWORD", 38, true),
            ],isCenterColumn: false,),
            SizedBox(height: 82),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScaffoldSecond(),));
              },
              child:  CustomButton.purple(
                "Next",
                boxShadow: [
                  BoxShadow(
                    offset: Offset(9, 9),
                    blurRadius: 16,
                    color: Color(0xFF6295E2).withValues(alpha: 0.11),
                  ),
                  BoxShadow(
                    offset: Offset(-9, -9),
                    blurRadius: 16,
                    color: Color(0xFFFFFFFF).withValues(alpha: 0.25),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );

  }
}
