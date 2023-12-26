import 'dart:io';

import 'package:agriculture/Controller/Profile/ProfileController.dart';
import 'package:agriculture/Model/MDProfile.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfileDetailController extends GetxController {
  RxInt idGender = 1.obs;

  String id = '';
  MDProfile profile = MDProfile();
  RxString avt = ''.obs;
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController date = TextEditingController();
  String birthDay = '';
  DateTime? pickData;
  RxList<File> imageFile = RxList<File>();
  String linkImage = '';

  void setGender(int value) {
    idGender.value = value;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    id = Get.arguments['id'];
    print(id);
    fecthProfileDetail();
  }

  void fecthProfileDetail() async {
    try {
      var response = await APICaller.getInstance().get('user/$id');
      if (response != null) {
        profile = MDProfile.fromJson(response['data']);
        avt.value = profile.avatar ?? '';
        name.text = profile.name ?? '';
        idGender.value = profile.gender ?? 0;
        phoneNumber.text = profile.phone ?? '';
        email.text = profile.email ?? '';
        birthDay = profile.birthDay ?? '';
        pickData = DateTime.parse(birthDay);
        date.text = DateFormat('dd/MM/yyyy').format(DateTime.parse(birthDay));
      }
    } catch (e) {}
  }

  Future<void> selectDate(BuildContext context) async {
    pickData = await showDatePicker(
      context: context,
      initialDate: birthDay!=''? DateTime.parse(birthDay):DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2200),
    );

    if (pickData != null) {
      date.text = DateFormat('dd/MM/yyyy').format(pickData!);
    }
  }

  void updateProfile() async {
    await postImage();
    var body = {
      "name": name.text,
      "avatar": linkImage!=''?linkImage:avt.value,
      "gender": idGender.value,
      "birth_day": DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').format(pickData!),
      "phone": phoneNumber.text
    };
    try {
      var response = await APICaller.getInstance().put('user/$id', body);
      if (response != null) {
        if (Get.isRegistered<ProfileController>()) {
          Get.find<ProfileController>().name.value = name.text;
        }
        Get.back();
        Utils.showSnackBar(
            title: 'Thông báo', message: 'Chỉnh sửa thành công !');
      }
    } catch (e) {}
  }

  postImage() async {
    if (imageFile.isNotEmpty) {
      try {
        var response = await APICaller.getInstance()
            .postFile('image/single', imageFile.first);
        if (response != null) {
          linkImage = response['image'];
          if (Get.isRegistered<ProfileController>()) {
            Get.find<ProfileController>().avatar.value = linkImage;
          }
        }
      } catch (e) {
        print('lỗi');
        print(e);
      }
    }
  }

  void getImage(int source) async {
    if (imageFile.isNotEmpty) {
      imageFile.clear();
    }
    List<File> file = await Utils.getImagePicker(source, false);
    imageFile.addAll(file);
    Get.back();
  }
}
