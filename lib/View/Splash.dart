import 'package:agriculture/Controller/SplashController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  Splash({super.key});
  var delete = Get.delete<SplashController>();
  final splashController = Get.put((SplashController()));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors
            .transparent, // Đặt màu nền của thanh trạng thái thành trong suốt
        statusBarIconBrightness: Brightness
            .dark, // Đặt màu biểu tượng trên thanh trạng thái thành tối
      ),
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assets/images/Splash.jpg"), fit: BoxFit.fill),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
