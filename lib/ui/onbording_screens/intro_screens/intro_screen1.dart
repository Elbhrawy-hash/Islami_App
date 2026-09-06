
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:AppColor.blackColor ,
      child: Column(

        children: [
        Padding(
          padding: const EdgeInsets.only(top: 30,right:  40,left: 40,),
          child: Image.asset("assets/images/onbording_images/header.png"),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
            child: Image.asset("assets/images/onbording_images/welcome.png"),
          )
        ],
      ),
    );
  }
}
