import 'dart:convert';

import 'package:agriculture/Model/MDNew.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewAllController extends GetxController {
  RxList<MDNew> listNew = RxList<MDNew>();
  final _httpClient = http.Client();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getList();
  }

  void getList() async {
    try {
      isLoading.value = true;
      final data = await _httpClient
          .get(Uri.parse('${APICaller.getInstance().BASE_URL}//New'));
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(data.bodyBytes));
        final List<MDNew> list =
            (jsonData as List).map((e) => MDNew.fromJson(e)).toList();
        listNew.value = list;
        isLoading.value = false;
      }
    } catch (e) {
      Utils.showSnackBar(title: 'Thông Báo', message: '$e');
    }
  }
  void readNew(int index) async {
    getList();
    String view = ((int.parse(listNew[index].view.toString())) + 1).toString();
    var body = {
      "view": view,
    };
    try {
      final data = await _httpClient.put(
          Uri.parse(
              '${APICaller.getInstance().BASE_URL}/New/${listNew[index].id}'),
          body: body);
      if (data.statusCode == 200) {
        listNew[index].view =
            (int.parse(listNew[index].view.toString()) + 1).toString();
        listNew.refresh();
      }
    } catch (e) {
      Utils.showSnackBar(title: 'Thông Báo', message: '$e');
    }
  }
}
