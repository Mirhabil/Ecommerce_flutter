import 'package:ecommerce_flutter/cubits/category/Category_Cubit.dart';
import 'package:ecommerce_flutter/cubits/category/Category_State.dart';
import 'package:ecommerce_flutter/custom_widgets/Category_Item.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_ChipGroup.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Search_Widget.dart';
import 'package:ecommerce_flutter/custom_widgets/Product_Item.dart';
import 'package:ecommerce_flutter/screens/Home_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/home/Home_Cubit.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryCubit()..fetchCategories(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedState) {
            return Padding(
              padding: EdgeInsets.only(left: 30, right: 30, top: 75),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomSearchWidget(),
                  SizedBox(height: 44),
                  CustomChipGroup(["Boys", "Girls", "Kids"],"CategoryScreen"),
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
                      itemCount: state.categoryList[state.activeIndex].clothes.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          state.categoryList[state.activeIndex].clothes[index].clothesImage,
                          state.categoryList[state.activeIndex].clothes[index].clothesName,
                          state.categoryList[state.activeIndex].clothes[index].price,
                        );
                      },
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
