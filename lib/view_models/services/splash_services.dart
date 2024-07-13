import 'dart:async';

import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';

class SplashServices {
  // run this timer so i can wait 3 seconds in splash screen
  void runTimer() {
    Timer(const Duration(seconds: 3), () => Get.offNamed(RouteName.homeView));
  }
}
