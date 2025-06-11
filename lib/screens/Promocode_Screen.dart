import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromocodeScreen extends StatelessWidget {
  const PromocodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: EdgeInsets.only(top: 60, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:CustomIconContainer(Icons.arrow_back),
                ),
                SizedBox(width: 45),
                Text(
                  "Promocodes",
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 28,
                    color: Color(0xFF434F67),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 36),
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
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
              child: Icon(
                size: 36,
                Icons.account_circle_rounded,
                color: Color(0xFF7C3375),
              ),
            ),
            SizedBox(height: 56),

            Container(
              padding: EdgeInsets.only(left: 35, top: 26, right: 51),
              decoration: BoxDecoration(color: Colors.white,boxShadow: [
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
              ],),
              width: 315,
              height: 173,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Promocode",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 16,
                          color: Color(0xFF434F67),
                        ),
                      ),
                      Text(
                        "8Z40ZE",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 16,
                          color: Color(0xFF434F67),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Status",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 16,
                          color: Color(0xFF434F67),
                        ),
                      ),

                      Text(
                        "Not used",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 16,
                          color: Color(0xFF434F67),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Begin Campaign",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 16,
                          color: Color(0xFF434F67),
                        ),
                      ),

                      Text(
                        "11.05.2012",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 16,
                          color: Color(0xFF434F67),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "End Campaign",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 16,
                          color: Color(0xFF434F67),
                        ),
                      ),

                      Text(
                        "15.05.2021",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 16,
                          color: Color(0xFF434F67),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 70),
            Image(image: AssetImage("assets/Rectangle 255.png"),width: 187,height: 190,),
          ],
        ),
      ),
    ) ;

  }
}
