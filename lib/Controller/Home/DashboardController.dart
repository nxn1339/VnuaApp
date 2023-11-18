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
      'icon': "assets/icons/home.svg",
      'icon_active': "assets/icons/home_active.svg",
      'tile': 'Trang chủ',
    },
    {
      'page': "Quizze",
      'screen': "",
      'icon': "assets/icons/graduation_cap.svg",
      'icon_active': "assets/icons/graduation_cap_active.svg",
      'tile': 'Trắc nghiệm',
    },
    {
      'page': "Profile",
      'screen': "",
      'icon': "assets/icons/user.svg",
      'icon_active': "assets/icons/user_active.svg",
      'tile': 'Cá nhân',
    },
  ];
}
