import 'package:agriculture/Model/MDNew.dart';
import 'package:get/get.dart';

class NewDetailController extends GetxController {
  Rx<MDNew> mdNew = MDNew().obs;
  @override
  void onReady() {
    super.onReady();
    if (Get.arguments[0] != null) {
      mdNew.value = Get.arguments[0];
    }
  }
}
