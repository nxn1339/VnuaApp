import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  RxBool isHidePassOld = true.obs;
  RxBool isHidePassNew = true.obs;
  RxBool isHidePassAgain = true.obs;

  TextEditingController oldPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController againPass = TextEditingController();

  RxString oldPassValidate = ''.obs;
  RxString newPassValidate = ''.obs;
  RxString againPassValidate = ''.obs;

  bool isCheckValidate = false;

  //hàm show text mật khẩu
  void showPass(RxBool isHidePass) {
    isHidePass.value = !isHidePass.value;
  }

  void checkChangePass() {
    if (oldPass.text.trim() != '' && newPass.text.trim() != '') {
      if (newPass.text.trim() == againPass.text.trim()) {
        isCheckValidate = true;
      } else {
        againPassValidate.value = 'Mật khẩu không giống nhau !';
      }
    } else {
      if (oldPass.text.trim() == '') {
        oldPassValidate.value = 'Mật khẩu cũ đang trống !';
        print(oldPass.text.trim());
      } else {
        oldPassValidate.value = '';
      }

      if (newPass.text.trim() == '') {
        newPassValidate.value = 'Mật khẩu mới đang trống !';
      } else {
        newPassValidate.value = '';
      }
    }
  }

  void resetValidate() {
    oldPassValidate.value = '';
    newPassValidate.value = '';
    againPassValidate.value = '';
  }
}
