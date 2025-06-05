import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomChipGroup extends StatelessWidget {
  List<String> chipNames;

  CustomChipGroup(this.chipNames);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      child: ListView.builder(
        itemCount: chipNames.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: index==0 ? 0 :27),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                chipNames[index],
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 20,
                  color: Color(0xFF834E7F),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
