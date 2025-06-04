import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  String hint;
  double left;
  double bottom;
  double top;
  bool isVisible;

  CustomTextField({
    required this.hint,
    required this.bottom,
    required this.left,
    required this.top,
    required this.isVisible,
  });

  CustomTextField.login(this.hint, this.top, this.isVisible)
    : left = 20,
      bottom = 18;

  CustomTextField.signup(this.hint, this.top, this.isVisible)
    : left = 8,
      bottom = 18;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 21, right: 26),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon:
              isVisible
                  ? Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Icon(Icons.visibility),
                  )
                  : null,
          hintText: hint,
          hintStyle: GoogleFonts.cormorantGaramond(
            fontSize: 18,
            color: Color(0xFF434F67),
          ),
          contentPadding: EdgeInsets.only(left: left, bottom: bottom, top: top),
        ),
      ),
    );
  }
}
