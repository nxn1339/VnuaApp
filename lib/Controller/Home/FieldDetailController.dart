import 'package:agriculture/Model/MDField.dart';
import 'package:get/get.dart';

class FieldDetailController extends GetxController {
  RxString nameField = ''.obs;
  RxList<Specialized> specialized = RxList<Specialized>();
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    nameField.value = Get.arguments['field'];
    specialized.value = Get.arguments['specialized'];
  }
}
