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

  bool isShowing = false;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: bottomNavigationBase(context),
        body: Stack(
          children: <Widget>[
            pageDefine(),
          ],
        ),
      ),
    );
  }

  Widget pageDefine() {
    switch (controller.nameRoute.value) {
      case "Home":
        return Home();
      case "Quizze":
        return Quizze();
      case "Profile":
        return Profile();
    }
    return Home();
  }

  Widget bottomNavigationBase(BuildContext context) {
    return Obx(() => (BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          elevation: 7,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: controller.pages.map((page) {
              return GestureDetector(
                onTap: () {
                  if (page['page'] != null &&
                      page['page'] != controller.nameRoute.value &&
                      page['page'] != "") {
                    controller.nameRoute.value = page['page'];
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        page['page'] != null &&
                                controller.nameRoute.value == page['page']
                            ? page['icon_active']
                            : page['icon'],
                        height: 25,
                        width: 25,
                        color: page['page'] != null &&
                                controller.nameRoute.value == page['page']
                            ? Color(0xFF0060AF)
                            : Color(0xFF6F767E),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      RichText(
                        text: TextSpan(
                          text: page['tile'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: page['page'] != null &&
                                    controller.nameRoute.value == page['page']
                                ? Color(0xFF0060AF)
                                : Color(0xFF6F767E),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        )));
  }
}
