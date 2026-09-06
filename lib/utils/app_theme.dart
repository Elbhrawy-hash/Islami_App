import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';

class AppTheme {
  static final ThemeData darkTheme=ThemeData(
//scaffoldBackgroundColor: AppColor.transparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      selectedItemColor: AppColor.whiteColor,
      unselectedItemColor: AppColor.blackColor,
      showUnselectedLabels: false,
    ),
appBarTheme: AppBarThemeData(
  backgroundColor: AppColor.blackColor,
  centerTitle: true,
  iconTheme: IconThemeData(
    color: AppColor.goldColor,
)
)
  );
}












//hot reload last changed at built.
//hot restart

//final===>you can let intialise but one value can takeing .
//const===>if teaking any value you cant change and must be inithelise at compile time