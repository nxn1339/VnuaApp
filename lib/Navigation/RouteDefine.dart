import 'package:agriculture/View/Home/Dashboard.dart';
import 'package:agriculture/View/Home/Home.dart';
import 'package:agriculture/View/News/New.dart';
import 'package:agriculture/View/Notify/Notify.dart';
import 'package:agriculture/View/Profile/Profile.dart';

class RouteDefine {
  static dynamic getPageByName(String pageName) {
    switch (pageName) {
      case 'Home':
        return Home();
      case 'Notify':
        return Notify();
      case 'Profile':
        return Profile();
      case 'Dashboard':
        return Dashboard();
      case 'New':
        return New();
    }
  }
}
