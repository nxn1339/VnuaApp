import 'dart:async';
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
  @override
  void onInit() {
    super.onInit();
    //get dữ liệu slide từ api
    getSlide();
    //get dữ liệu tin tức từ api
    getList();
  }

  void getSlide() async {
    try {
      final data = await _httpClient
          .get(Uri.parse('https://64b1215d062767bc4825bd18.mockapi.io/api/v1/Slide'));
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

  void getList() async {
    try {
      final data = await APICaller.getInstance().get('news');
      if (data !=null) {
        List<dynamic> list = data['data'];
       var listItem =
            list.map((dynamic json) => MDNew.fromJson(json)).toList();
      listNew.addAll(listItem);

      }
    } catch (e) {
      Utils.showSnackBar(title: 'Thông Báo', message: '$e');
    }
  }

  setActiveIndex(int index) {
    activeIndex.value = index;
  }

//   void readNew(int index) async {
//     getList();
//     String view = ((int.parse(listNew[index].view.toString())) + 1).toString();
//     var body = {
//       "view": view,
//     };
//     try {
//       final data = await _httpClient.put(
//           Uri.parse(
//               '${APICaller.getInstance().BASE_URL}/New/${listNew[index].id}'),
//           body: body);
//       if (data.statusCode == 200) {
//         listNew[index].view =
//             (int.parse(listNew[index].view.toString()) + 1).toString();
//         listNew.refresh();
//       }
//     } catch (e) {
//       Utils.showSnackBar(title: 'Thông Báo', message: '$e');
//     }
//   }
 }
