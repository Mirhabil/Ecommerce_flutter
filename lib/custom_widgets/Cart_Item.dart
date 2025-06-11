import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  String imageName;
  double margin;

  CartItem(this.imageName, this.margin);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      width: 314,
      height: 132,
      decoration: BoxDecoration(
        color: Colors.white,
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
      padding: EdgeInsets.only(left: 36, right: 25, top: 19, bottom: 21),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image(
              image: AssetImage(imageName),
              width: 80,
              height: 86,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 41),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "White",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 21,
                          color: Color(0xFF31405D),
                        ),
                      ),
                      Text(
                        "Total",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 17,
                          color: Color(0xFF31405D),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3),
                Padding(
                  padding: EdgeInsets.only(left: 41),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "15 AZN",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 17,
                          color: Color(0xFF8D4888),
                        ),
                      ),
                      Text(
                        "30",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 17,
                          color: Color(0xFF8D4888),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: EdgeInsets.only(left: 14),
                  child: Row(
                    children: [
                      Text("+", style: TextStyle(fontSize: 14)),
                      SizedBox(width: 25),
                      Text("2"),
                      SizedBox(width: 25),
                      Text("-", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
