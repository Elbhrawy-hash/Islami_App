import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home_screeen/home_scren.dart';

import 'package:islami_app/ui/onbording_screens/onbording_Screen.dart';
import 'package:islami_app/utils/app_route.dart';
import 'package:islami_app/utils/app_theme.dart';

import 'ui/home_screeen/tabes/quran_tabe/sure_detiels/sure_detiels.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.onbordingRouteName,
      routes:{
        AppRoute.homeRouteName:(context)=>HomeScren(),
        AppRoute.onbordingRouteName:(context)=>OnbordingScreen(),
        AppRoute.sureDtielsRouteName:(context)=>SureDetiels(),



      } ,
      darkTheme:AppTheme.darkTheme ,
      themeMode: ThemeMode.dark,
    );
  }
}
