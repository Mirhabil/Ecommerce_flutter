import 'package:ecommerce_flutter/custom_widgets/Cart_Item.dart';
import 'package:ecommerce_flutter/custom_widgets/Category_Item.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Button.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 29, right: 31),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CustomIconContainer(Icons.line_weight_outlined),
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
                  itemCount: listForCart.length,
                  itemBuilder: (context, index) {
                    if (listForCart[index] is CartItemClass) {
                      return CartItem(
                        "assets/images.jpeg",
                        index != 0 ? 30 : 0,
                      );
                    } else if (listForCart[index] is ButtonClass) {
                      return Padding(
                        padding: EdgeInsets.only(top: 66, bottom: 88),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton.black(
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
                            Text(
                              "250",
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
      ),
    );
  }
}

class ViewType {}

class CartItemClass extends ViewType {
  String color;
  int price;
  int totalCount;
  int count;

  CartItemClass(this.color, this.price, this.totalCount, this.count);
}

class ButtonClass extends ViewType {
  String buttonText;

  ButtonClass(this.buttonText);
}

List<ViewType> listForCart = [
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  CartItemClass("Yellow", 20, 30, 2),
  ButtonClass("Make Purchase"),
];
