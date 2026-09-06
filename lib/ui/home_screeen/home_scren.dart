import 'package:flutter/material.dart';
import 'package:islami_app/ui/home_screeen/tabes/headth_tabe/headth_tabe.dart';
import 'package:islami_app/ui/home_screeen/tabes/quran_tabe/quran_tabe.dart';
import 'package:islami_app/ui/home_screeen/tabes/redio_tabe/redio_tabe.dart';
import 'package:islami_app/ui/home_screeen/tabes/sephe_tabe/spehe_tabe.dart';
import 'package:islami_app/ui/home_screeen/tabes/time_tabe/time_tabe.dart';
import 'package:islami_app/utils/app_color.dart';
import '../../utils/app_assets.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  int selectedIndex = 0;


  final List<String> beackGroundImage = [
    AppAssets.quranBg,
    AppAssets.hadiseBg,
    AppAssets.sephaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];

  // قائمة التبويبات (شاشات)
  final List<Widget> tabsList = [
    QuranTabe(),
    HeadthTabe(),
    SpeheTabe(),
    RedioTabe(),
    TimeTabe(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          beackGroundImage[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: AppColor.goldColor,
              ),
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: buttonNavigationIcon(0, AppAssets.iconQuran),
                    label: "Quran",
                  ),
                  BottomNavigationBarItem(
                    icon: buttonNavigationIcon(1, AppAssets.iconHadise),
                    label: "Hadith",
                  ),
                  BottomNavigationBarItem(
                    icon: buttonNavigationIcon(2, AppAssets.iconSepha),
                    label: "Sebha",
                  ),
                  BottomNavigationBarItem(
                    icon: buttonNavigationIcon(3, AppAssets.iconRadio),
                    label: "Radio",
                  ),
                  BottomNavigationBarItem(
                    icon: buttonNavigationIcon(4, AppAssets.iconTime),
                    label: "Time",
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Image.asset("assets/images/onbording_images/header.png"),
                Expanded(child: tabsList[selectedIndex]), // هنا بنعرض التبويب المناسب
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonNavigationIcon(int index, String assetPath) {
    return selectedIndex == index
        ? Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(66),
        color: AppColor.blackBgColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
      child: ImageIcon(AssetImage(assetPath)),
    )
        : ImageIcon(AssetImage(assetPath));
  }
}
