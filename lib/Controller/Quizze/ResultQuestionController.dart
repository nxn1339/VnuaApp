import 'package:agriculture/Model/Quizze/MDResultQuestion.dart';
import 'package:get/get.dart';

class ResultQuestionController extends GetxController {
  Rx<MDResultQuestion> resultQuestion = MDResultQuestion().obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    resultQuestion.value = Get.arguments['resultQuestion'];
  }
}
