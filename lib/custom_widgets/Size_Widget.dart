import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  const SizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: sizeList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: index!=0 ? 22 : 0),
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
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

            child: Center(child: Text(sizeList[index]),)
          );
        },
      ),
    );
  }
}

List<String> sizeList = ["XS", "S", "M", "L", "XL"];
