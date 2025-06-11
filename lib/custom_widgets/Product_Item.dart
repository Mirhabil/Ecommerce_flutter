import 'package:ecommerce_flutter/custom_widgets/Custom_Container.dart';
import 'package:flutter/cupertino.dart';

class ProductItem extends StatelessWidget {
  String imageName;
  double widthOfContainer;
  double heightOfContainer;

  ProductItem({ required this.imageName, required this.widthOfContainer, required this.heightOfContainer});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      widthOfContainer: widthOfContainer,
      heightOfContainer: heightOfContainer,
      isCenterColumn: true,
      textFieldWidgetList: [
        Center(
          child: Image.asset(
            imageName,
            width: 84,
            height: 87,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
