import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_TextField.dart';

class CustomContainer extends StatelessWidget {
  double widthOfContainer;
  double heightOfContainer;
  List<Widget> textFieldWidgetList;
  bool isCenterColumn;

  CustomContainer({
    required this.widthOfContainer,
    required this.heightOfContainer,
    required this.textFieldWidgetList,
    required this.isCenterColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
      width: widthOfContainer,
      height: heightOfContainer,
      child: Column(
        mainAxisAlignment:
            isCenterColumn ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: textFieldWidgetList,
      ),
    );
  }
}
