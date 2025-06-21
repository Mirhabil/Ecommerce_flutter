import 'dart:math';

import 'package:ecommerce_flutter/cubits/favorites/Favorites_Cubit.dart';
import 'package:ecommerce_flutter/cubits/favorites/Favorites_State.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:ecommerce_flutter/screens/Product_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubits/home/Home_Cubit.dart';

class FavoritesScreen extends StatelessWidget {
  List<ClothesModel> clothes;

  FavoritesScreen(this.clothes);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit()..fetchClothes(),
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 30,
                right: 30,
                top: 60,
                bottom: 87,
              ),
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
                        itemCount: state.clothes.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(clothes: state.clothes[index]),));
                            },
                            child:       Container(
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
                                                  state.clothes[index].clothesName
                                                      .substring(
                                                    0,
                                                    (state.clothes[index]
                                                        .clothesName
                                                        .length /
                                                        2)
                                                        .toInt(),
                                                  ),
                                                  style:
                                                  GoogleFonts.cormorantGaramond(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Color(0xFF31405D),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 36,
                                                  ),
                                                  child: Image(
                                                    image: AssetImage(
                                                      "assets/Icon.png",
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 14),
                                            Row(
                                              children: [
                                                Text(
                                                  "Color",
                                                  style:
                                                  GoogleFonts.cormorantGaramond(
                                                    fontSize: 12,
                                                    color: Color(0xFF31405D),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 17,
                                                  ),
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
                                                  state.clothes[index].price.toString(),
                                                  style:
                                                  GoogleFonts.cormorantGaramond(
                                                    fontSize: 16,
                                                    color: Color(0xFF834E7F),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 36,
                                                  ),
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
                                      image: NetworkImage(
                                        state.clothes[index].clothesImage,
                                      ),
                                      width: 138,
                                      height: 182,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ) ;

                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Column();
        },
      ),
    );
  }
}
