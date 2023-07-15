import 'dart:async';

import 'package:agriculture/Navigation/Navigation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration (seconds:2),() => Navigation.navigateTo(page: 'Dashboard'),);
  }
}
