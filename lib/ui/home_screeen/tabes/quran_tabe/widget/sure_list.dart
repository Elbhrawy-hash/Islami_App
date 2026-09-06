import 'package:flutter/material.dart';
import 'package:islami_app/models/sures_data.dart';
import 'package:islami_app/utils/app_assets.dart';
import 'package:islami_app/utils/app_styels.dart';

class SureList extends StatelessWidget {
  final int index;

  const SureList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.sureNumber),
            Text(
              "${index + 1}",
              style: AppStyels.bold16White,
            ),
          ],
        ),
        SizedBox(width: width*0.04),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranData.surahNamesEnglish[index],
              style: AppStyels.bold20Withe,
            ),
            Text(
              "${QuranData.surahVerses[index]} Verses",
              style: AppStyels.bold14Withe,
            ),
          ],
        ),
        const Spacer(),
        Text(
          QuranData.surahNamesArabic[index],
          style: AppStyels.bold20Withe,
        ),
      ],
    );
  }
}
