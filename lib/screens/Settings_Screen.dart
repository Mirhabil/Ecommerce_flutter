import 'package:ecommerce_flutter/custom_widgets/Custom_Button_Settings.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:ecommerce_flutter/screens/Promocode_Screen.dart';
import 'package:ecommerce_flutter/screens/Transaction_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 60, left: 33, right: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 2),
                        blurRadius: 3,
                        color: Color(0xFF687C98).withAlpha(15),
                      ),
                    ],
                  ),
                  child: Icon(
                    size: 36,
                    Icons.account_circle_rounded,
                    color: Color(0xFF7C3375),
                  ),
                ),
                SizedBox(width: 96),
                Icon(Icons.edit_outlined,color: Colors.purple,),
              ],
            ),
            SizedBox(height: 25),
            Text(
              "Person Name",
              textAlign: TextAlign.center,
              style: GoogleFonts.cormorantGaramond(
                fontSize: 16,
                color: Color(0xFF434F67),
              ),
            ),
            SizedBox(height: 33),
            Container(
              width: 315,
              height: 204,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: RadialGradient(
                  colors: [
                    Color(0xFFD0AECD).withAlpha(40),
                    Color(0xFFA58FEB).withAlpha(58),
                    Color(0xFF768DCF).withAlpha(69),
                    Color(0xFFCDF6FC).withAlpha(80),
                  ],
                ),
              ),
            ),
            SizedBox(height: 49),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionScreen(),));
              },
              child: CustomButtonSettings(
                "Transactions",
                Icons.monetization_on_outlined,
              ),
            ),
           
            SizedBox(height: 36),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PromocodeScreen(),));
              },
              child:  CustomButtonSettings("Promocodes", Icons.card_giftcard),
            )
          ],
        ),
      );
  }
}
