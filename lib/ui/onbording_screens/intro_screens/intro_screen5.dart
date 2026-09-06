
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class IntroScreen5 extends StatelessWidget {
  const IntroScreen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:AppColor.blackColor ,
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,right:  40,left: 40,),
            child: Image.asset("assets/images/onbording_images/header.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0,right:  40,left: 40,),
            child: Image.asset("assets/images/onbording_images/mieac.png"),
          ),
          Text("Holy Quran Radio",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.goldColor,
          ),),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20),
            child: Text("You can listen to the Holy Quran Radio\n through the application for free and easily",style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColor.goldColor,

            ),),
          )

        ],
      ),
    );
  }
}
