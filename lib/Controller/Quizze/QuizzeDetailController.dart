import 'package:agriculture/Model/Quizze/MDQuestion.dart';
import 'package:agriculture/Model/Quizze/MDResultQuestion.dart';
import 'package:agriculture/Navigation/Navigation.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizzeDetailController extends GetxController {
  String id = '';
  RxList<MDQuestion> listQuestion = RxList<MDQuestion>();
  RxList<int> listQuestionAnswer = RxList<int>(); // list câu hỏi đã chọn
  List<String> listIDAnswer = []; //list id câu trả lời
  RxInt selectQuest = 0.obs;
  RxBool isLoading = false.obs;
  MDResultQuestion resultQuestion = MDResultQuestion();
  RxString title = ''.obs;

  @override
  void onReady() async {
    // TODO: implement onReady
    super.onReady();
    id = await Get.arguments['id'];
    title.value = Get.arguments['title'];
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
        var itemID = List<String>.generate(listQuestion.length, (index) => '');
        listIDAnswer.addAll(itemID);
        listQuestionAnswer.addAll(item);
        isLoading.value = false;
      }
    } catch (e) {}
  }

  resultTest() async {
    var body = {"answer": listIDAnswer};
    try {
      var response = await APICaller.getInstance().post('package/$id', body);
      if (response != null) {
        Utils.showDialog(
            title: 'Nộp kết quả',
            content: Text('Bạn có muốn nộp kết quả này không'),
            onCancel: () {},
            onConfirm: () {
              Get.back();
              bool allNonZero =
                  listQuestionAnswer.every((element) => element != 0);

              if (allNonZero) {
                resultQuestion = MDResultQuestion.fromJson(response['data']);
                Navigation.navigateTo(
                    page: 'ResultQuestion',
                    arguments: {'resultQuestion': resultQuestion});
              } else {
                Utils.showSnackBar(
                    title: 'Thông Báo', message: 'Chưa trả lời hết câu hỏi');
              }
            });
      }
    } catch (e) {}
  }

  //chọn câu hỏi
  void selectAnswer(int index) {
    listQuestionAnswer[selectQuest.value] = index + 1;
    listIDAnswer[selectQuest.value] =
        listQuestion[selectQuest.value].answer?[index].id ?? '';
  }

  void nextQuest() {
    if (selectQuest.value < listQuestionAnswer.length - 1) {
      selectQuest++;
    }
  }
}
