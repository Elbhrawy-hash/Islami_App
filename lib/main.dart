import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home_screeen/home_scren.dart';
import 'package:islami_app/utils/app_route.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.homeRouteName,
      routes:{
        AppRoute.homeRouteName:(context)=>HomeScren(),
      } ,
    );
  }
}
