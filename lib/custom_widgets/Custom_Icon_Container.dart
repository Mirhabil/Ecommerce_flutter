import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconContainer extends StatelessWidget {

  IconData icon;

  CustomIconContainer(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 2),
            blurRadius: 3,
            color: Color(0xFF687C98).withAlpha(15),
          ),
        ],
      ),
      child: Icon(icon, color: Color(0xFF7C3375)),
    );
  }
}
