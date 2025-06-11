import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonSettings extends StatelessWidget {


  String textOFButton;
  IconData iconOfButton;

  CustomButtonSettings(this.textOFButton,this.iconOfButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 22, bottom: 21, left: 24),
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
      width: 315,
      height: 86,
      child: Row(
        children: [
          Icon(
            iconOfButton,
            //Icons.monetization_on_outlined,
            size: 32,
            color: Colors.purple,
          ),
          SizedBox(width: 53),
          Text(
            textOFButton,
            style: GoogleFonts.cormorantGaramond(
              fontSize: 16,
              color: Color(0xFF434F67),
            ),
          ),
        ],
      ),
    );
  }
}
