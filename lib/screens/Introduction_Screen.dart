import 'package:ecommerce_flutter/custom_widgets/Custom_Button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
          child:Padding(padding: EdgeInsets.only(left: 78,right: 78),child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 120,),
              Row(mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.account_circle_rounded, size: 54,),
                  Text("Logo",
                    style: GoogleFonts.cormorantGaramond(color: Color(0xFF434F67),
                        fontSize: 44,
                        fontWeight: FontWeight.bold),)


                ],
              ),
              SizedBox(height: 170,),
              CustomButton.purple("Login"),
              SizedBox(height: 60,),
              CustomButton.purple("Sign Up")


            ],
          ),)

        )



    );
  }
}
