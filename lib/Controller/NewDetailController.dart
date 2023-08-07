import 'package:agriculture/Model/MDNewDetail.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:get/get.dart';

class NewDetailController extends GetxController {
  Rx<MDNewDetail> mdNew = MDNewDetail().obs;
  int id = 0;
  @override
  void onReady() {
    super.onReady();
    if (Get.arguments[0] != null) {
      id = Get.arguments[0];
    }
    getNews();
  }

  void getNews() async {
    try {
      var data = await APICaller.getInstance().get('news/$id');
      if (data != null) {
        mdNew.value = MDNewDetail.fromJson(data['data']);
        mdNew.refresh();
        print(data);
      }
    } catch (e) {
      Utils.showSnackBar(title: 'Thông Báo', message: '$e');
    }
  }
}
