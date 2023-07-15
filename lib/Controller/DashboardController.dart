import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt selectedPos = 0.obs;
  RxInt selectedPosBottomBar = 0.obs;
  RxInt preSelectedPos = 0.obs;
  RxBool showHasNoti = false.obs;
  Rx<String> nameRoute = 'Home'.obs;
  final List<Map<String, dynamic>> pages = [
    {
      'page': "Home",
      'screen': "",
      'icon': "assets/icons/icon_home.svg",
      'icon_active': "assets/icons/icon_home_active.svg",
      'tile': 'Trang chủ',
    },
    {
      'page': "NewAll",
      'screen': "",
      'icon': "assets/icons/calendar_tick_home.svg",
      'icon_active': "assets/icons/calendar_tick_active.svg",
      'tile': 'Tin tức',
    },
    {
      'page': "Notify",
      'screen': "",
      'icon': "assets/icons/notification.svg",
      'icon_active': "assets/icons/notification_active.svg",
      'tile': 'Thông báo',
    },
    {
      'page': "Profile",
      'screen': "",
      'icon': "assets/icons/user_octagon.svg",
      'icon_active': "assets/icons/user_octagon_active.svg",
      'tile': 'Cá nhân',
    },
  ];
}
