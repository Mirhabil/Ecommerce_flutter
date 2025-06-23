import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  String imageName;
  String brandName;
  double price;

  CategoryItem(this.imageName, this.brandName, this.price);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageName,
                width: 200,
                height: 250,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 19),
          Text(
            brandName,
            style: GoogleFonts.cormorantGaramond(
              color: Color(0xFF31405D),
              fontSize: 26,
            ),
          ),
          SizedBox(height: 17),
          Text(
            price.toString(),
            style: GoogleFonts.cormorantGaramond(
              color: Color(0xFF834E7F),
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
