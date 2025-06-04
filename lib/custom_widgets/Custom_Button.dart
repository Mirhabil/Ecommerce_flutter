import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  Color buttonColor;

  CustomButton({required this.buttonText, required this.buttonColor});

  CustomButton.purple(this.buttonText) : buttonColor = Color(0xFF7C3375);

  CustomButton.black(this.buttonText) : buttonColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6, bottom: 6, left: 30, right: 30),
      // width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF7C3375).withValues(alpha: 0.2),
            offset: Offset(5, 5),
            blurRadius: 10,
            spreadRadius: 0
          )
        ]
      ),
      child: Text(
        buttonText,
        style: GoogleFonts.cormorant(
          color: buttonColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
