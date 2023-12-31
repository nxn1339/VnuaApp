import 'dart:async';
import 'package:agriculture/Model/MDNew.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAllController extends GetxController {
  RxList<MDNew> listNew = RxList<MDNew>();
  RxBool isLoading = false.obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  int page = 1;
  int total = 0;
  Timer? _debounce;
  TextEditingController search = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fecthList();
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
          scrollController.value.position.maxScrollExtent) {
        if (total > listNew.length) {
          page++;
          fecthList();
        }
      }
    });
  }

  void fecthList() async {
    if (page == 1) {
      isLoading.value = true;
    }
    try {
      final data = await APICaller.getInstance()
          .get('news?page=$page&keyword=${search.text}');
      if (data != null) {
        total = data['meta']['total'];
        List<dynamic> list = data['data'];

        var listItem =
            list.map((dynamic json) => MDNew.fromJson(json)).toList();
        listNew.addAll(listItem);
        if (page == 1) {
          isLoading.value = false;
        }
      }
    } catch (e) {}
  }

  refreshData() {
    page = 1;
    listNew.clear();
    fecthList();
  }

  // tìm kiếm
  onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      refreshData();
    });
  }
}
