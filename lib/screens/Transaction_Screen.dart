import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60, left: 30, right: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:CustomIconContainer(Icons.arrow_back),
                ),
                SizedBox(width: 45),
                Text(
                  "Transactions",
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 28,
                    color: Color(0xFF434F67),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Expanded(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: index != 0 ? 32 : 0),
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
                      width: 315,
                      height: 106,
                      child: Row(
                        children: [
                          SizedBox(width: 28),
                          Text(
                            "1",
                            style: GoogleFonts.raleway(
                              fontSize: 20,
                              color: Color(0xFF7C3375),
                            ),
                          ),
                          SizedBox(width: 84),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Lorem Azn",
                                style: GoogleFonts.cormorantGaramond(
                                  fontSize: 16,
                                  color: Color(0xFF434F67),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 7),
                              Text(
                                "Date:  10.05.2021",
                                style: GoogleFonts.raleway(
                                  fontSize: 12,
                                  color: Color(0xFF434F67),
                                ),
                              ),
                            ],
                          ),
                        ],
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
