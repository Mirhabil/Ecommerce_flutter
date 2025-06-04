import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  List<BoxShadow>? boxShadow;

  CustomButton({
    required this.buttonText,
    required this.buttonColor,
    required this.boxShadow,
  });

  CustomButton.purple(this.buttonText, {required this.boxShadow})
    : buttonColor = Color(0xFF7C3375);

  CustomButton.black(this.buttonText, {required this.boxShadow})
    : buttonColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6, bottom: 6, left: 30, right: 30),
      // width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        boxShadow: boxShadow,
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
