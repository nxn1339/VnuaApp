import 'dart:convert';

import 'package:agriculture/Model/MDNew.dart';
import 'package:agriculture/Model/MDSlide.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final _httpClient = http.Client();
  //list của slide
  RxList<MDSlide> listSlide = RxList<MDSlide>();
  //list của tin tức
  RxList<MDNew> listNew = RxList<MDNew>();
  //index của slide
  RxInt activeIndex = 0.obs;
  RxBool isBlinking = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController textEditName = TextEditingController();
  TextEditingController textEditPhoneNumber = TextEditingController();
  TextEditingController textEditEmail = TextEditingController();
  TextEditingController textEditContent = TextEditingController();
  RxString textValidateName = ''.obs;
  RxString textValidatePhoneNumber = ''.obs;
  RxString textValidateContent = ''.obs;

  @override
  void onInit() {
    super.onInit();
    //get dữ liệu slide từ api
    getSlide();
    //get dữ liệu tin tức từ api
    getListNews();
    startAutoBlink();
  }

  void chekcDeleteController() {
    //check nếu chưa load đc dữ liệu xóa controller và tạo lại
    //nếu có dữ liệu rồi sẽ đc dữ lại
    if (listNew.isEmpty) {
      final delete = Get.delete<HomeController>();
      final controller = Get.put(HomeController());
    }
  }

  void getSlide() async {
    try {
      final data = await _httpClient.get(Uri.parse(
          'https://64b1215d062767bc4825bd18.mockapi.io/api/v1/Slide'));
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(data.bodyBytes));
        final List<MDSlide> list =
            (jsonData as List).map((e) => MDSlide.fromJson(e)).toList();
        listSlide.value = list;
      }
    } catch (e) {
      Utils.showSnackBar(title: 'Thông Báo', message: '$e');
    }
  }

  void getListNews() async {
    isLoading.value = true;
    try {
      final data = await APICaller.getInstance().get('news?page=1');
      if (data != null) {
        List<dynamic> list = data['data'];
        // Lấy 3 phần tử đầu tiên từ danh sách và chuyển đổi chúng thành đối tượng MDNew
        var listItem =
            list.take(3).map((dynamic json) => MDNew.fromJson(json)).toList();
        listNew.addAll(listItem);
        isLoading.value = false;
      }
    } catch (e) {
      Utils.showSnackBar(title: 'Thông Báo', message: '$e');
    }
  }

  setActiveIndex(int index) {
    activeIndex.value = index;
  }

  void startAutoBlink() {
    Future.delayed(Duration(milliseconds: 500), () {
      isBlinking.value = !isBlinking.value;
      startAutoBlink(); // Kích hoạt tự động nhấp nháy lại sau 1 giây
    });
  }

  void refreshData() {
    listNew.clear();
    getListNews();
  }

  //hàm gửi tư vấn
  void sendConsultation() async {
    var body = {
      "name": textEditName.text,
      "phone": textEditPhoneNumber.text,
      "email": textEditEmail.text,
      "content": textEditContent.text
    };
    try {
      var response = await APICaller.getInstance().post('advise', body);
      if (response != null) {
        Get.back();
        Utils.showSnackBar(
            title: 'Thông báo', message: 'Gửi tư vấn thành công !');
      }
    } catch (e) {}
  }

  void resetEditText() {
    textEditName.text = '';
    textEditPhoneNumber.text = '';
    textEditEmail.text = '';
    textEditContent.text = '';
  }

  bool checkValidate() {
    if (textEditName.text.trim() == '') {
      textValidateName.value = 'Tên không được để trống';
    } else {
      textValidateName.value = '';
    }
    if (textEditPhoneNumber.text.trim() == '') {
      textValidatePhoneNumber.value = 'Số điện thoại không được để trống';
    } else {
      textValidatePhoneNumber.value = '';
    }
    if (textEditContent.text.trim() == '') {
      textValidateContent.value = 'Nội dung không được để trống';
    } else {
      textValidateContent.value = '';
    }

    if (textEditName.text.trim() != '' &&
        textEditPhoneNumber.text.trim() != '' &&
        textEditContent.text.trim() != '') {
      return true;
    } else {
      return false;
    }
  }

  void resetValidate(String value) {
    if (value.trim() != '') {
      textValidateName.value = '';
      textValidatePhoneNumber.value = '';
      textValidateContent.value = '';
    }
  }
}
