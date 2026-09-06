
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home_screeen/tabes/quran_tabe/widget/most_recent_widget.dart';
import 'package:islami_app/ui/home_screeen/tabes/quran_tabe/widget/sure_list.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_route.dart';
import 'package:islami_app/utils/app_styels.dart';

class QuranTabe extends StatelessWidget {
  const QuranTabe({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width*0.04),
      child: Column(
        spacing: height*0.02,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor: AppColor.goldColor,
            style: TextStyle(
              color: AppColor.whiteColor
            ),
            decoration: InputDecoration(
              enabledBorder: borderDecoration(),
              focusedBorder: borderDecoration(),
              prefixIcon: Image.asset(AppAssets.searchIcon),
                hintText: "Sura Name",
              hintStyle: AppStyels.bold16White,
            ),
          ),
         MostRecentWidget(),
          Text("Sura List",style: AppStyels.bold16White,),
          Expanded(child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo naveget to sure deteiles
                    Navigator.of(context).pushNamed(AppRoute.sureDtielsRouteName,arguments: index);

                  },
                    child: SureList(index: index));
              },
              separatorBuilder: (context, index) {
                 return Padding(
                   padding: EdgeInsetsGeometry.symmetric(vertical: height*0.02),
                   child: Divider(
                     thickness: 2,
                     color: AppColor.whiteColor,
                     indent: width*0.1,
                     endIndent: width*0.1,
                   ),
                 );
              },
              itemCount: 114
          ))

        ],
      ),
    );
  }
  OutlineInputBorder borderDecoration(){
   return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
            color: AppColor.goldColor
        )

    );
  }
}
