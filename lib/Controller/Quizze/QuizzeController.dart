import 'package:agriculture/Model/Quizze/MDPackage.dart';
import 'package:agriculture/Model/Quizze/MDQuestion.dart';
import 'package:agriculture/Navigation/Navigation.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:get/get.dart';

class QuizzeController extends GetxController {
  RxList<MDPackage> listPackage = RxList<MDPackage>();
  List<MDQuestion> question = [];
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fecthPackage();
  }

  void fecthPackage() async {
    isLoading.value = true;
    try {
      var response = await APICaller.getInstance().get('package');
      if (response != null) {
        List<dynamic> list = response['data'];
        var listItem =
            list.map((dynamic json) => MDPackage.fromJson(json)).toList();
        listPackage.addAll(listItem);
        listPackage.refresh();
        isLoading.value = false;
      }
    } catch (e) {}
  }

  //lấy các câu hỏi trên api
  void doTheTest(String id, String name) async {
    try {
      var response = await APICaller.getInstance()
          .get('package/74c8329e-85e7-11ee-b0fc-089798d3');
      if (response != null) {
        List<dynamic> list = response['data'];
        var listItem =
            list.map((dynamic json) => MDQuestion.fromJson(json)).toList();
        question.addAll(listItem);
        Navigation.navigateTo(
            page: 'QuizzeDetail',
            arguments: {'title': name, 'question': question});
      }
    } catch (e) {}
  }

  void refresh() {
    listPackage.clear();
    fecthPackage();
  }
}
