import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {

  String icon;
  String itemText;
  String languageText;
  MenuItem(this.icon,this.itemText,this.languageText);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: EdgeInsets.only(bottom: 34),
      padding: EdgeInsets.only(top: 9,bottom: 9,left: 43),
      color: Colors.white,
      child:Row(
        children: [
          Image(image: AssetImage(icon)),
          SizedBox(width: 56,),
          Text(itemText,style: GoogleFonts.cormorantGaramond(color: Color(0xFF434F67),fontSize: 20),),
          SizedBox(width: 46,),
          Text(languageText,style: GoogleFonts.cormorantGaramond(color: Color(0xFF7C3375),fontSize: 18),)
        ],
      ),
    );
  }
}
