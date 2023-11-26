import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfileDetailController extends GetxController {
  RxString gender = 'Nam'.obs;
  int idGender = 1;
  RxString date = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;

  void setGender(String value) {
    gender.value = value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    stringGender();
  }

  void stringGender() {
    switch (idGender) {
      case 1:
        gender.value = 'Nam';
        break;
      case 2:
        gender.value = 'Nữ';
        break;
      default:
        gender.value = 'Khác';
        break;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      print('Bạn đã chọn ngày: $pickedDate');
      date.value = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }
}
