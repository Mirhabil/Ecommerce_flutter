import 'package:ecommerce_flutter/cubits/branches/Branches_State.dart';
import 'package:ecommerce_flutter/cubits/carts/Carts_Cubit.dart';
import 'package:ecommerce_flutter/cubits/carts/Carts_State.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  String imageName;
  double margin;
  int count;



  int index;

  CartItem(this.imageName, this.margin,this.count,this.index);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit,CartsState>(builder: (context, state) {
      final cartsCubit=context.read<CartsCubit>();
      return Container(
        margin: EdgeInsets.only(top: margin),
        width: 314,
        height: 132,
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
        padding: EdgeInsets.only(left: 36, right: 25, top: 19, bottom: 21),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Image(
                image: NetworkImage(imageName),
                width: 80,
                height: 86,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 41),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "White",
                          style: GoogleFonts.cormorantGaramond(
                            fontSize: 21,
                            color: Color(0xFF31405D),
                          ),
                        ),
                        Text(
                          "Total",
                          style: GoogleFonts.cormorantGaramond(
                            fontSize: 17,
                            color: Color(0xFF31405D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: EdgeInsets.only(left: 41),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "15 AZN",
                          style: GoogleFonts.cormorantGaramond(
                            fontSize: 17,
                            color: Color(0xFF8D4888),
                          ),
                        ),
                        Text(
                          "30",
                          style: GoogleFonts.cormorantGaramond(
                            fontSize: 17,
                            color: Color(0xFF8D4888),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 14),
                  Padding(
                    padding: EdgeInsets.only(left: 14),
                    child: Row(
                      children: [
                        InkWell(
                          child: Text("-", style: TextStyle(fontSize: 15)),
                          onTap: (){
                            cartsCubit.decrementCount(index);
                          },
                        ),

                        SizedBox(width: 25),
                        SizedBox(width: 28,child: Text("${count}",textAlign:TextAlign.center),),
                        SizedBox(width: 25),
                        InkWell(
                          child: Text("+", style: TextStyle(fontSize: 15)),
                          onTap: (){
                            cartsCubit.incrementCount(index);
                          },
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },);

  }
}
