import 'package:ecommerce_flutter/cubits/home/Home_Cubit.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Button.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Container.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:ecommerce_flutter/custom_widgets/Size_Widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatelessWidget {



  ClothesModel clothes;
  ProductScreen({required this.clothes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 106),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(188),
                    ),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(clothes.clothesImage),
                      height: 436,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CustomIconContainer(Icons.arrow_back),
                    ),
                    top: 48,
                    left: 34,
                  ),

                  Positioned(right: 27,
                      top:47,
                      child: Container(
                    height: 30,
                    width: 62,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                        offset: Offset(1, 2),
                        blurRadius: 3,
                        color: Color(0xFF687C98).withAlpha(15),
                      ),
                    ],
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(Icons.favorite_border_outlined),
                    )
                  ))
                ],
              ),
              SizedBox(height: 58),
              Padding(
                padding: EdgeInsets.only(left: 27, right: 31),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          clothes.clothesName,
                          style: GoogleFonts.cormorantGaramond(
                            fontSize: 27,
                            color: Color(0xFF31405D),
                          ),
                        ),
                        Text(
                          "20",
                          style: GoogleFonts.cormorantGaramond(
                            fontSize: 27,
                            color: Color(0xFF834E7F),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      clothes.clothesCompany,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 18,
                        color: Color(0xFF31405D),
                      ),
                    ),
                    SizedBox(height: 22),
                    Text(
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 16,
                        color: Color(0xFF818181),
                      ),
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Tempus, sed sociis at pellentesque adipiscing "
                          "tristique eu lectus venenatis.",
                    ),
                    SizedBox(height: 39),
                    Text(
                      "Choose Size",
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 20,
                        color: Color(0xFF31405D),
                      ),
                    ),
                    SizedBox(height: 31),
                    SizeWidget(),
                    SizedBox(height: 39),
                    Text(
                      "Choose Color",
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 20,
                        color: Color(0xFF31405D),
                      ),
                    ),
                    SizedBox(height: 28),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        itemCount: colorsList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: index != 0 ? 44 : 0),
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: colorsList[index],
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 43),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton.black(
                          "Buy now",
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
                        Image(
                          image: AssetImage("assets/Group 167.png"),
                          width: 42,
                          height: 36,
                          color: Colors.purple,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ) ;

  }
}

List<Color> colorsList = [
  Colors.purple,
  Colors.purpleAccent,
  Colors.blue,
  Colors.lightBlue,
];
