import 'package:agriculture/Model/MDAdvise.dart';
import 'package:agriculture/Model/MDAdviseDetail.dart';
import 'package:agriculture/Navigation/Navigation.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MailBoxController extends GetxController {
  RxList<MDAdvise> listAdvise = RxList<MDAdvise>();
  Rx<ScrollController> scrollController = ScrollController().obs;
  int page = 1;
  int total = 0;
  RxBool isLoading = false.obs;
  MDAdviseDetail advise = MDAdviseDetail();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fecthAdvise();
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
          scrollController.value.position.maxScrollExtent) {
        if (total > listAdvise.length) {
          page++;
          fecthAdvise();
        }
      }
    });
  }

  void fecthAdvise() async {
    if (page == 1) {
      isLoading.value = true;
    }
    try {
      var response = await APICaller.getInstance().get('advise?page=$page');
      if (response != null) {
        List<dynamic> list = response['data'];
        total = response['meta']['total'];
        var listItem =
            list.map((dynamic json) => MDAdvise.fromJson(json)).toList();
        listAdvise.addAll(listItem);
        listAdvise.refresh();
        if (page == 1) {
          isLoading.value = false;
        }
      }
    } catch (e) {}
  }

  refreshData() {
    page = 1;
    listAdvise.clear();
    fecthAdvise();
  }

  void readMailBox(int index) async {
    try {
      var response =
          await APICaller.getInstance().get('advise/${listAdvise[index].id}');
      if (response != null) {
        advise = MDAdviseDetail.fromJson(response['data']);
        Navigation.navigateTo(
            page: 'MailBoxDetail', arguments: {'advise': advise});
        listAdvise[index].isReaded = 1;
        listAdvise.refresh();
      }
    } catch (e) {}
  }
}
