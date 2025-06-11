import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 87),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CustomIconContainer(Icons.line_weight_outlined),

              Padding(
                padding: EdgeInsets.only(left: 53),
                child: Text(
                  "Favorites",
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 30,
                    color: Color(0xFF31405D),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 36),
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: index != 0 ? 24 : 0),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 60,
                          top: 38,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(9, 9),
                                  blurRadius: 16,
                                  color: Color(
                                    0xFF6295E2,
                                  ).withValues(alpha: 0.11),
                                ),
                                BoxShadow(
                                  offset: Offset(-9, -9),
                                  blurRadius: 16,
                                  color: Color(
                                    0xFFFFFFFF,
                                  ).withValues(alpha: 0.25),
                                ),
                              ],
                            ),
                            width: 273,
                            height: 136,
                            child: Padding(
                              padding: EdgeInsets.only(left: 114),
                              child: Column(
                                children: [
                                  SizedBox(height: 24),
                                  Row(
                                    children: [
                                      Text(
                                        "Selflove",
                                        style: GoogleFonts.cormorantGaramond(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF31405D),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 36),
                                        child: Image(
                                          image: AssetImage("assets/Icon.png"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14),
                                  Row(
                                    children: [
                                      Text(
                                        "Color",
                                        style: GoogleFonts.cormorantGaramond(
                                          fontSize: 12,
                                          color: Color(0xFF31405D),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 17),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFDADFE7),
                                          ),
                                          width: 11,
                                          height: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        "28 AZN",
                                        style: GoogleFonts.cormorantGaramond(
                                          fontSize: 16,
                                          color: Color(0xFF834E7F),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 36),
                                        child: Image(
                                          image: AssetImage(
                                            "assets/Group 167.png",
                                          ),
                                          width: 24,
                                          height: 20,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: AssetImage("assets/images.jpeg"),
                            width: 138,
                            height: 182,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
