import 'dart:math';

import 'package:ecommerce_flutter/cubits/carts/Carts_Cubit.dart';
import 'package:ecommerce_flutter/cubits/carts/Carts_State.dart';
import 'package:ecommerce_flutter/custom_widgets/Cart_Item.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Button.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:ecommerce_flutter/screens/Product_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartsCubit()..fetchListForChart(),
      child: BlocBuilder<CartsCubit, CartsState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            return Padding(
              padding: EdgeInsets.only(top: 50, left: 29, right: 31),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      InkWell(
                        child: CustomIconContainer(Icons.line_weight_outlined),
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),

                      SizedBox(width: 94),
                      Text(
                        "Cart",
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 24,
                          color: Color(0xFF31405D),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 44),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.listOfCarts.length,
                        itemBuilder: (context, index) {
                          final currentItem = state.listOfCarts[index];
                          if (currentItem is CartItemClass) {
                            final item = state.listOfCarts[index];
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              onDismissed: (DismissDirection direction) {
                                state.listOfCarts.remove(index);
                              },
                              child: GestureDetector(
                                child: CartItem(
                                  currentItem.imagePath,
                                  index != 0 ? 30 : 0,
                                  currentItem.count,
                                  index,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => ProductScreen(
                                            clothesId: currentItem.clothesId,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else if (currentItem is ButtonClass) {
                            return Padding(
                              padding: EdgeInsets.only(top: 66, bottom: 88),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder:
                                            (context) => AlertDialog(
                                              title: Text(
                                                "${state.totalPriceOfItems}\$ for all items",
                                              ),
                                              content: Text(
                                                "Do you want to purchase?",
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed:
                                                      () => Navigator.pop(
                                                        context,
                                                        'Cancel',
                                                      ),
                                                  child: const Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          "Successful Purchase",
                                                        ),
                                                        backgroundColor:
                                                            Colors.lightGreen,
                                                      ),
                                                    );

                                                    Navigator.pop(
                                                      context,
                                                      'OK',
                                                    );
                                                  },
                                                  child: const Text('Purchase'),
                                                ),
                                              ],
                                            ),
                                      );
                                    },
                                    child: CustomButton.black(
                                      "Make Purchase",
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
                                  ),

                                  Text(
                                    "${state.totalPriceOfItems}\$",
                                    style: GoogleFonts.cormorantGaramond(
                                      fontSize: 30,
                                      color: Color(0xFF7C3375),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
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

class ViewType {}

class CartItemClass extends ViewType {
  String color;
  double price;
  int totalCount;
  int count;
  String imagePath;
  int clothesId;

  CartItemClass(
    this.color,
    this.price,
    this.totalCount,
    this.count,
    this.imagePath,
    this.clothesId,
  );
}

class ButtonClass extends ViewType {
  String buttonText;

  ButtonClass(this.buttonText);
}

// List<ViewType> listForCart = [
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   CartItemClass("Yellow", 20, 30, 2),
//   ButtonClass("Make Purchase"),
// ];
