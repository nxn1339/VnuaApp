import 'package:agriculture/View/Home/Dashboard.dart';
import 'package:agriculture/View/Home/Field.dart';
import 'package:agriculture/View/Home/FieldDetail.dart';
import 'package:agriculture/View/Home/Home.dart';
import 'package:agriculture/View/Login/Login.dart';
import 'package:agriculture/View/News/NewAll.dart';
import 'package:agriculture/View/News/NewDetail.dart';
import 'package:agriculture/View/Profile/MailBox.dart';
import 'package:agriculture/View/Profile/MailBoxDetail.dart';
import 'package:agriculture/View/Profile/ProfileDetail.dart';
import 'package:agriculture/View/Quizze/Quizze.dart';
import 'package:agriculture/View/Profile/Profile.dart';
import 'package:agriculture/View/Quizze/QuizzeDetail.dart';

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
      case 'QuizzeDetail':
        return QuizzeDetail();
      case 'Login':
        return Login();
      case 'MailBox':
        return MailBox();
      case 'MailBoxDetail':
        return MailBoxDetail();
      case 'ProfileDetail':
        return ProfileDetail();
      case 'Field':
        return Field();
      case 'FieldDetail':
        return FieldDetail();
    }
  }
}
