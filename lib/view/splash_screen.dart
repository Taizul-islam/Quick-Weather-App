import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:quick_weather_app/res/assets/animated_assets.dart';
import 'package:quick_weather_app/res/colors/app_color.dart';

import '../view_models/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.runTimer();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: AppColor.primaryColor,
          systemNavigationBarColor: AppColor.primaryColor),
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: Center(
            child: Lottie.asset(AnimatedAssets.splashScreen,
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.width * 0.7)),
      ),
    );
  }
}
