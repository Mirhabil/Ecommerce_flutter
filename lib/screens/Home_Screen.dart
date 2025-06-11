import 'package:ecommerce_flutter/custom_widgets/Custom_ChipGroup.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Search_Widget.dart';
import 'package:ecommerce_flutter/custom_widgets/Product_Item.dart';
import 'package:ecommerce_flutter/screens/Branches_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 74),
                  child: CustomIconContainer(Icons.line_weight_outlined),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 74, right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BranchesScreen(),
                        ),
                      );
                    },
                    child: CustomIconContainer(Icons.location_on_outlined),
                  ),
                ),
              ],
            ),
            SizedBox(height: 29),
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: CustomSearchWidget(),
            ),
            SizedBox(height: 42),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 30,
                    color: Color(0xFF434F67),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(right: 30),
                  width: 75,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(child: Text("view all")),
                ),
              ],
            ),

            SizedBox(height: 27),

            //First ListView
            SizedBox(
              height: 166,
              child: ListView.builder(
                itemCount: imagesList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: index != 0 ? 18 : 0),
                    child: ProductItem(imageName:  imagesList[index], widthOfContainer: 137, heightOfContainer: 166),
                  );
                },
              ),
            ),
            SizedBox(height: 60),
            CustomChipGroup(["New 21", "Trending", "Recent"]),
            SizedBox(height: 54),

            MediaQuery.removePadding(
              removeTop: false,
              context: context,
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: imagesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 32,
                  mainAxisSpacing: 22,
                  childAspectRatio: 197/239
                ),
                itemBuilder: (context, index) {
                  return ProductItem(imageName:  imagesList[index], widthOfContainer:  197,  heightOfContainer: 239);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> imagesList = [
  "assets/images.jpeg",
  "assets/images.jpeg",
  "assets/images.jpeg",
  "assets/images.jpeg",
  "assets/images.jpeg",
  "assets/images.jpeg",
  "assets/images.jpeg",
  "assets/images.jpeg",
  "assets/images.jpeg",
  "assets/images.jpeg",
  "assets/images.jpeg",
];
