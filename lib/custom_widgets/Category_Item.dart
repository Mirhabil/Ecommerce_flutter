import 'package:flutter/cupertino.dart';

class CategoryItem extends StatelessWidget {
  String imageName;
  String brandName;
  int price;

  CategoryItem(this.imageName,this.brandName,this.price);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
          child: Image.asset(
            imageName,
            width: 138,
            height: 182,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 19,),
        Text(brandName),
        SizedBox(height: 17,),
        Text(price.toString())
      ],
    );
  }
}
