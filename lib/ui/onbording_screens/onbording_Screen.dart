import 'package:flutter/material.dart';
import 'package:islami_app/ui/onbording_screens/intro_screens/intro_screen1.dart';
import 'package:islami_app/ui/onbording_screens/intro_screens/intro_screen3.dart';
import 'package:islami_app/ui/onbording_screens/intro_screens/intro_screen4.dart';
import 'package:islami_app/ui/onbording_screens/intro_screens/intro_screen5.dart';
import 'package:islami_app/utils/app_route.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/app_color.dart';
import 'intro_screens/intro_screen2.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _controller = PageController();
  bool onLast = false;
  bool onFirst=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller, // ✅ ربط الـ controller
            onPageChanged: (index) {
              setState(() {
                onLast = (index == 4);
                onFirst=(index==0);
              });
            },
            children: const [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
              IntroScreen4(),
              IntroScreen5(),
            ],
          ),
          // dot indicator + buttons
          Container(
            alignment: const Alignment(0, 0.90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // back button بدل skip
                onFirst?
                Text(""):GestureDetector(
                  child: const Text("back",style: TextStyle(
                    color: AppColor.goldColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),
                  onTap: () {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 5,
                  effect: WormEffect(
                    dotColor: Color(0xff707070),        // لون الدوتس العادية
                    activeDotColor: Color(0xffFFD482), // لون الدوت النشطة
                    dotHeight: 7,
                    dotWidth: 7,
                  ),
                ),
                onLast
                    ? GestureDetector(
                  child: const Text("done",style: TextStyle(
                    color: AppColor.goldColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),),
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AppRoute.homeRouteName);
                  },
                )
                    : GestureDetector(
                  child: const Text("next",style: TextStyle(
                    color: AppColor.goldColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),
                  onTap: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
