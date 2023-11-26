import 'package:agriculture/Model/MDField.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:get/get.dart';

class FieldController extends GetxController {
  RxList<MDField> listField = RxList<MDField>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fecthField();
  }

  void fecthField() async {
    try {
      var response = await APICaller.getInstance().get('field');
      if (response != null) {
        List<dynamic> list = response['data'];

        var listItem =
            list.map((dynamic json) => MDField.fromJson(json)).toList();
        listField.addAll(listItem);
      }
    } catch (e) {}
  }
}
