import 'dart:convert';

import 'package:agriculture/Model/MDNew.dart';
import 'package:agriculture/Model/MDSlide.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
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

  @override
  void onInit() {
    super.onInit();
    //get dữ liệu slide từ api
    getSlide();
    //get dữ liệu tin tức từ api
    getListNews();
    startAutoBlink();
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
    try {
      final data = await APICaller.getInstance().get('news?page=1');
      if (data != null) {
        List<dynamic> list = data['data'];
        // Lấy 3 phần tử đầu tiên từ danh sách và chuyển đổi chúng thành đối tượng MDNew
        var listItem =
            list.take(3).map((dynamic json) => MDNew.fromJson(json)).toList();
        listNew.addAll(listItem);
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
}
