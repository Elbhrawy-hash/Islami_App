
import 'package:flutter/material.dart';
import '../../../utils/app_color.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color:AppColor.blackColor ,
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,right:  40,left: 40,),
            child: Image.asset("assets/images/onbording_images/header.png"),
          ),
          Padding(
          padding: const EdgeInsets.only(top: 0,right:  40,left: 40,),
            child: Image.asset("assets/images/onbording_images/mosque.png"),
          ),
          Text("Welcome To Islami",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.goldColor,
          ),),
          Padding(
            padding: const EdgeInsets.only(top: 20,bottom: 20),
            child: Text("We Are Very Excited To Have You In Our\n                         Community",style: TextStyle(
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
