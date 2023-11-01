import 'package:agriculture/View/Home/Dashboard.dart';
import 'package:agriculture/View/Home/Home.dart';
import 'package:agriculture/View/Login/Login.dart';
import 'package:agriculture/View/News/NewAll.dart';
import 'package:agriculture/View/News/NewDetail.dart';
import 'package:agriculture/View/Quizze/Quizze.dart';
import 'package:agriculture/View/Profile/Profile.dart';
import 'package:agriculture/View/Quizze/QuizzeDetail.dart';
import 'package:agriculture/View/Recruitment/Recruitment.dart';

class RouteDefine {
  static dynamic getPageByName(String pageName) {
    switch (pageName) {
      case 'Home':
        return Home();
      case 'Quizze':
        return Quizze();
      case 'Profile':
        return Profile();
      case 'Dashboard':
        return Dashboard();
      case 'NewAll':
        return NewAll();
      case 'NewDetail':
        return NewDetail();
      case 'recruitment':
        return Recruitment();
      case 'QuizzeDetail':
        return QuizzeDetail();
      case 'Login':
        return Login();
    }
  }
}
