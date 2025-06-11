import 'package:ecommerce_flutter/custom_widgets/Custom_Container.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 87),
              child: Row(
                children: [
                  CustomIconContainer(Icons.arrow_back),
                  Padding(
                    padding: EdgeInsets.only(left: 44),
                    child: Text(
                      "Our Branches",
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 30,
                        color: Color(0xFF434F67),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 57),
            Expanded(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: branchesList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 0 : 32),
                      child: CustomContainer(
                        widthOfContainer: 314,
                        heightOfContainer: 100,
                        textFieldWidgetList: [
                          Column(
                            children: [
                              Text(
                                branchesList[index].branchName,
                                style: GoogleFonts.cormorantGaramond(
                                  fontSize: 20,
                                  color: Color(0xFF434F67),
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: EdgeInsets.only(left: 37, right: 32),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      branchesList[index].number1,
                                      style: GoogleFonts.cormorantGaramond(
                                        fontSize: 18,
                                        color: Color(0xFF434F67),
                                      ),
                                    ),
                                    Text(
                                      branchesList[index].number2,
                                      style: GoogleFonts.cormorantGaramond(
                                        fontSize: 18,
                                        color: Color(0xFF434F67),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                        isCenterColumn: true,
                      ),
                    );
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

List<BranchData> branchesList = [
  BranchData(
    "Babək Plaza, Blok C,3-cü mərtəbə",
    "+994 50 111 11 11",
    "+994 50 222 22 22",
  ),
  BranchData("Baku City Branch", "123456", "12345678"),
  BranchData("Baku City Branch", "123456", "12345678"),
];

class BranchData {
  String branchName;
  String number1;
  String number2;

  BranchData(this.branchName, this.number1, this.number2);
}
