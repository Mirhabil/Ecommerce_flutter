import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeWidget extends StatefulWidget {
  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: sizeList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: index != 0 ? 22 : 0),
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: activeIndex == index ? Color(0xFF875B83) : Colors.white,
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

              child: Center(
                child: Text(
                  sizeList[index],
                  style: TextStyle(
                    color:
                        activeIndex == index ? Colors.white : Color(0xFF875B83),
                  ),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                activeIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}

List<String> sizeList = ["XS", "S", "M", "L", "XL"];
