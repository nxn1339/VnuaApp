import 'dart:async';
import 'package:agriculture/Controller/Home/DashboardController.dart';
import 'package:agriculture/View/Home/Home.dart';
import 'package:agriculture/View/Quizze/Quizze.dart';
import 'package:agriculture/View/Profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  Dashboard({
    Key? key,
    this.title,
  }) : super(key: key);
  final String? title;

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: bottomNavigationBase(context),
          body: pageDefine()),
    );
  }

  Widget bottomNavigationBase(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.question_mark_outlined),
          label: 'Trắc Nghiệm',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Cá nhân',
        ),
      ],
      currentIndex: controller.selectedIndex.value,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black54, // Màu sắc khi không được chọn
      onTap: controller.onItemTapped,
    );
  }

  Widget pageDefine() {
    switch (controller.selectedIndex.value) {
      case 0:
        return Home();
      case 1:
        return Quizze();
      case 2:
        return Profile();
      default:
        return Home();
    }
  }
}
