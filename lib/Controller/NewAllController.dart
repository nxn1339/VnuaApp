import 'package:agriculture/Model/MDNew.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:get/get.dart';

class NewAllController extends GetxController {
  RxList<MDNew> listNew = RxList<MDNew>();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getList();
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
  void readNew(int index) async {
    // getList();
    // String view = ((int.parse(listNew[index].view.toString())) + 1).toString();
    // var body = {
    //   "view": view,
    // };
    // try {
    //   final data = await _httpClient.put(
    //       Uri.parse(
    //           '${APICaller.getInstance().BASE_URL}/New/${listNew[index].id}'),
    //       body: body);
    //   if (data.statusCode == 200) {
    //     listNew[index].view =
    //         (int.parse(listNew[index].view.toString()) + 1).toString();
    //     listNew.refresh();
    //   }
    // } catch (e) {
    //   Utils.showSnackBar(title: 'Thông Báo', message: '$e');
    // }
  }
}
