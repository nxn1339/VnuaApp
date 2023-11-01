import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isHidePass = true.obs;

  void showPass() {
    isHidePass.value = !isHidePass.value;
  }
}
