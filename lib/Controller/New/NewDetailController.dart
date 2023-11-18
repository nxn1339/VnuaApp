import 'dart:convert';

import 'package:agriculture/Model/MDNew.dart';
import 'package:agriculture/Model/MDNewDetail.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewDetailController extends GetxController {
  final mdNew = MDNewDetail().obs;
  RxList<MDNew> listNew = RxList<MDNew>();
  RxBool isLoading = false.obs;
  ScrollController scrollController = ScrollController();
  @override
  void onReady() {
    super.onReady();
    if (Get.arguments['id'] != null) {
      getNews(Get.arguments['id']);
    }
    getList();
  }

  void getNews(String id) async {
    isLoading.value = true;
    try {
      var data = await APICaller.getInstance().get('news/$id');
      if (data != null) {
        mdNew.value = MDNewDetail.fromJson(data['data']);
        mdNew.refresh();
        isLoading.value = false;
      }
    } catch (e) {
      Utils.showSnackBar(title: 'Thông Báo', message: '$e');
    }
  }

  void getList() async {
    try {
      final data = await APICaller.getInstance().get('news?page=1');
      if (data != null) {
        List<dynamic> list = data['data'];
        var listItem =
            list.take(5).map((dynamic json) => MDNew.fromJson(json)).toList();
        listNew.addAll(listItem);
      }
    } catch (e) {
      Utils.showSnackBar(title: 'Thông Báo', message: '$e');
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0, // Vị trí cuộn đến (đầu danh sách)
      duration: Duration(milliseconds: 500), // Thời gian cuộn (tùy chỉnh)
      curve: Curves.easeInOut, // Hình dạng độ cong cuộn (tùy chỉnh)
    );
  }
}
