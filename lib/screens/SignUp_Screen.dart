import 'package:ecommerce_flutter/custom_widgets/Custom_Button.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Container.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIconContainer(Icons.arrow_back),
          SizedBox(height: 53),
          Padding(
            padding: EdgeInsets.only(left: 24, right: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: CustomContainer(
                    widthOfContainer: 323,
                    heightOfContainer: 482,
                    textFieldWidgetList: [
                      CustomTextField.signup("NAME", 70, false),
                      CustomTextField.signup("SURNAME", 38, false),
                      CustomTextField.signup("Email", 28, false),
                      CustomTextField.signup("PASSWORD", 24, false),
                      CustomTextField.signup("CONFIRM PASSWORD", 28, true),
                    ],
                  ),
                ),
                SizedBox(height: 115),
                CustomButton.purple(
                  "NEXT",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
