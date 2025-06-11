import 'package:ecommerce_flutter/custom_widgets/Category_Item.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_ChipGroup.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Search_Widget.dart';
import 'package:ecommerce_flutter/custom_widgets/Product_Item.dart';
import 'package:ecommerce_flutter/screens/Home_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 30,right: 30,top: 75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomSearchWidget(),
            SizedBox(height: 44),
            CustomChipGroup(["Boys", "Girls", "Kids"]),
            SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 49,
                  // childAspectRatio: 0.76,
                ),
                itemCount: categoryItemsList.length,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    categoryItemsList[index].imageName,
                    categoryItemsList[index].brandName,
                    categoryItemsList[index].price,
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}

class ItemsForCategory {
  String imageName;
  String brandName;
  int price;

  ItemsForCategory(this.imageName, this.brandName, this.price);
}

List<ItemsForCategory> categoryItemsList = [
  ItemsForCategory("assets/images.jpeg", "Selflove", 28),
  ItemsForCategory("assets/images.jpeg", "Selflove", 28),
  ItemsForCategory("assets/images.jpeg", "Selflove", 28),
  ItemsForCategory("assets/images.jpeg", "Selflove", 28),
  ItemsForCategory("assets/images.jpeg", "Selflove", 28),
  ItemsForCategory("assets/images.jpeg", "Selflove", 28),
  ItemsForCategory("assets/images.jpeg", "Selflove", 28),
  ItemsForCategory("assets/images.jpeg", "Selflove", 28),
  ItemsForCategory("assets/images.jpeg", "Selflove", 28),
  ItemsForCategory("assets/images.jpeg", "Selflove", 28),
  ItemsForCategory("assets/images.jpeg", "Selflove", 28),
];
