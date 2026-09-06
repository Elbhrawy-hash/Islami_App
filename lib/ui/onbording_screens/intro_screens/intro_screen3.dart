
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

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
            child: Image.asset("assets/images/onbording_images/quran.png"),
          ),
          Text("Reading the Quran",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.goldColor,
          ),),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20),
            child: Text("Read, and your Lord is the Most Generous",style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColor.goldColor,

            ),),
          )

        ],
      ),
    );
  }
}
