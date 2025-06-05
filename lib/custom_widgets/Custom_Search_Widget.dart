import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: SizedBox(
        width: 315,
        height: 45,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            hintStyle: GoogleFonts.cormorantGaramond(
              fontSize: 18,
              color: Color(0xFF7C3375),
            ),
            suffixIcon: Icon(Icons.search, color: Color(0xFF7C3375)),
            contentPadding: EdgeInsets.only(left: 28),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple),
            ),
          ),
        ),
      ),
    );
  }
}
