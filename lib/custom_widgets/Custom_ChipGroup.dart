import 'package:ecommerce_flutter/cubits/branches/Branches_State.dart';
import 'package:ecommerce_flutter/cubits/category/Category_Cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubits/home/Home_Cubit.dart';

class CustomChipGroup extends StatelessWidget {
  List<String> chipNames;
  String screenUsage;

  CustomChipGroup(this.chipNames,this.screenUsage);



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      child: ListView.builder(
        itemCount: chipNames.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final HomeCubit? homeCubit =
          screenUsage == "HomeScreen" ? context.read<HomeCubit>() : null;
          final CategoryCubit? categoryCubit =
          screenUsage == "CategoryScreen" ? context.read<CategoryCubit>() : null;

          final int activeIndex = screenUsage == "HomeScreen"
              ? homeCubit?.activeIndex ?? 0
              : categoryCubit?.activeIndex ?? 0;

          final bool isSelected = index == activeIndex;

          return GestureDetector(
            onTap: (){
              print("Tapped chip index: $index");
              if(screenUsage=="HomeScreen"){
                if(index==0){
                  homeCubit?.filterForNew();
                }else if(index==1){
                  homeCubit?.filterForTrending();
                }else{
                  homeCubit?.filterForRecent();
                }
              }else if(screenUsage=="CategoryScreen"){
                if(index==0){
                  categoryCubit?.chipClicked(0);
                }else if(index==1){
                  categoryCubit?.chipClicked(1);
                }else{
                  categoryCubit?.chipClicked(2);
                }
              }

            },
            child: Container(
              margin: EdgeInsets.only(left: index==0 ? 0 :27),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? Colors.purple : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  chipNames[index],
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 20,
                    color: isSelected ? Colors.white : Color(0xFF834E7F),
                  ),
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
