import 'package:agriculture/Model/Quizze/MDQuestion.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:get/get.dart';

class QuizzeDetailController extends GetxController {
  String id = '';
  RxList<MDQuestion> listQuestion = RxList<MDQuestion>();
  RxList<int> listQuestionAnswer = RxList<int>(); // list câu hỏi đã chọn
  RxInt selectQuest = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    id = await Get.arguments['id'];
    doTheTest(id);
  }

  //lấy các câu hỏi trên api
  void doTheTest(String id) async {
    isLoading.value = true;
    try {
      var response = await APICaller.getInstance().get('package/$id');
      if (response != null) {
        List<dynamic> list = response['data'];
        var listItem =
            list.map((dynamic json) => MDQuestion.fromJson(json)).toList();
        listQuestion.addAll(listItem);
        var item = List<int>.generate(listQuestion.length, (index) => 0);
        listQuestionAnswer.addAll(item);
        isLoading.value = false;
      }
    } catch (e) {}
  }

  //chọn câu hỏi
  void selectAnswer(int index) {
    listQuestionAnswer[selectQuest.value] = index + 1;
    print(listQuestionAnswer.first);
  }

  void nextQuest() {
    if (selectQuest.value < listQuestionAnswer.length - 1) {
      selectQuest++;
    } else {
      print(listQuestionAnswer);
    }
  }
}
