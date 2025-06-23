import 'package:ecommerce_flutter/custom_widgets/Menu_Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 95),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            Icon(Icons.account_circle_rounded, size: 54),
            SizedBox(width: 31),
            Text(
              "Logo",
              style: GoogleFonts.cormorantGaramond(
                fontSize: 44,
                color: Color(0xFF434F67),
              ),
            ),
          ]),
          SizedBox(height: 61,),
          ListView.builder(
            padding: EdgeInsets.only(bottom: 0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: listForMenu.length,
            itemBuilder: (context, index) {
              return MenuItem(
                listForMenu[index].icon,
                listForMenu[index].itemText,
                listForMenu[index].languageText ?? "",
              );
            },
          ),
          SizedBox(height: 51,),
          Padding(padding: EdgeInsets.only(left: 29),child: Text("Social Media",style: GoogleFonts.cormorantGaramond(
            fontSize: 24,
            color: Color(0xFF434F67),
          )),),
          SizedBox(height: 58,),
          Row(
            children: [
              SizedBox(width: 44,),
              Image(image: AssetImage("assets/Group 252.png"),),
              SizedBox(width: 50,),
              Image(image: AssetImage("assets/Group 252.png")),
              SizedBox(width: 50,),
              Image(image: AssetImage("assets/Group 254.png")),
              SizedBox(width: 50,),
              Image(image: AssetImage("assets/Vector.png")),
            ],
          )

        ],
      ),
    );
  }
}

class MenuListItem {
  String icon;
  String itemText;
  String? languageText;

  MenuListItem({
    required this.icon,
    required this.itemText,
    required this.languageText,
  });
}

List<MenuListItem> listForMenu = [
  MenuListItem(
    icon: "assets/Vector.png",
    itemText: "Languages",
    languageText: "AZ",
  ),
  MenuListItem(
    icon: "assets/Group 242.png",
    itemText: "About Us",
    languageText: null,
  ),
  MenuListItem(
    icon: "assets/Group 243.png",
    itemText: "Contact Us",
    languageText: null,
  ),
  MenuListItem(
    icon: "assets/Group 244.png",
    itemText: "Log Out",
    languageText: null,
  ),
];
