import 'package:dio/dio.dart';
import 'package:ecommerce_flutter/cubits/branches/Brancehs_Cubit.dart';
import 'package:ecommerce_flutter/cubits/branches/Branches_State.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Container.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BranchesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BranchesCubit()..fetchBranches(),
      child: Scaffold(
        body: BlocConsumer<BranchesCubit, BranchesState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadedState) {
              return Padding(
                padding: EdgeInsets.only(left: 30, right: 33),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 87),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CustomIconContainer(Icons.arrow_back),
                          ),

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
                          itemCount: state.branchData.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: index == 0 ? 0 : 32,
                              ),
                              child: CustomContainer(
                                widthOfContainer: 314,
                                heightOfContainer: 100,
                                textFieldWidgetList: [
                                  Column(
                                    children: [
                                      Text(
                                        state.branchData[index].branchName,
                                        style: GoogleFonts.cormorantGaramond(
                                          fontSize: 20,
                                          color: Color(0xFF434F67),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 37,
                                          right: 32,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              state.branchData[index].number1,
                                              style:
                                                  GoogleFonts.cormorantGaramond(
                                                    fontSize: 18,
                                                    color: Color(0xFF434F67),
                                                  ),
                                            ),
                                            Text(
                                              state.branchData[index].number2,
                                              style:
                                                  GoogleFonts.cormorantGaramond(
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
              );
            }
            return Container();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}

class BranchData {
  String branchName;
  String number1;
  String number2;

  BranchData(this.branchName, this.number1, this.number2);
}
