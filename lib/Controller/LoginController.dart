import 'package:agriculture/Controller/ProfileController.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //biến ẩn hiện mật khẩu
  RxBool isHidePass = true.obs;
  //controller của textfield
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  //biến này để thể hiện textfield có rỗng hay không
  RxBool isUserNull = true.obs;
  RxBool isPassNull = true.obs;

  //hàm show text mật khẩu
  void showPass() {
    isHidePass.value = !isHidePass.value;
  }

  //hàm login
  void login() async {
    var body = {"username": user.text, "password": pass.text};
    try {
      var response = await APICaller.getInstance().post('user/login', body);
      if (response != null) {
        if (Get.isRegistered<ProfileController>() == true) {
          saveUser(response);
          Get.back();
        }
      }
    } catch (e) {
      Utils.showSnackBar(title: 'Thông báo', message: '$e');
    }
  }

  void saveUser(var response) {
    Utils.saveStringWithKey('id', response['data']['id']);
    Utils.saveStringWithKey('name', response['data']['name']);
    Utils.saveStringWithKey('avatar', response['data']['avatar']);
    Utils.saveStringWithKey('token', response['data']['token']);
  }
}
