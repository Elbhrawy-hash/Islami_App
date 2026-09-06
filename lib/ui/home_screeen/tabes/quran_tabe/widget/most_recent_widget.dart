import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_assets.dart' show AppAssets;
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_styels.dart';

class MostRecentWidget extends StatelessWidget {
  const MostRecentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Column(
      spacing: height*0.02,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Most Recently  ",style:AppStyels.bold16White ),
        SizedBox(
          height: height*0.16,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.goldColor,
                  ),
                  child:
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Al-Anbiya",style: AppStyels.bold24black,),
                            Text("الأنبياء",style: AppStyels.bold24black,),
                            Text("112 Verses  ",style: AppStyels.bold14black,),

                          ],
                        ),

                        Image.asset(AppAssets.mostRcentBng),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index){
                return SizedBox(width: width*0.04,);
              },
              itemCount: 10
          ),
        ),

      ],
    );
  }
}
