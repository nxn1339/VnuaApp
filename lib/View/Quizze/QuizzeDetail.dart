import 'package:agriculture/Controller/Quizze/QuizzeDetailController.dart';
import 'package:agriculture/Model/Quizze/MDQuestion.dart';
import 'package:agriculture/Utils/UtilColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizzeDetail extends StatelessWidget {
  QuizzeDetail({super.key});
  Size size = const Size(0, 0);
  var delete = Get.delete<QuizzeDetailController>();
  final controller = Get.put(QuizzeDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.title.value,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Obx(
          () => controller.isLoading.value == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                spacing: 5,
                                runSpacing: 5,
                                children: List.generate(
                                    controller.listQuestionAnswer.length,
                                    (index) => GestureDetector(
                                        onTap: () {
                                          controller.selectQuest.value = index;
                                        },
                                        child: numberQuestion(index))),
                              ),
                              Text(
                                '${controller.listQuestion[controller.selectQuest.value].content}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: UtilColor.textBlue),
                                textAlign: TextAlign.center,
                              ),
                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                                padding: const EdgeInsets.all(8.0),
                                // List of widgets to be displayed in the grid
                                children: List.generate(
                                    controller
                                            .listQuestion[
                                                controller.selectQuest.value]
                                            .answer
                                            ?.length ??
                                        0, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.selectAnswer(index);
                                    },
                                    child: cardAnswer(
                                        controller
                                            .listQuestion[
                                                controller.selectQuest.value]
                                            .answer![index],
                                        index),
                                  );
                                }),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    controller.nextQuest();
                                  },
                                  child: const Text('Tiếp')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget cardAnswer(Answer answer, int index) {
    return Card(
      color: controller.listQuestionAnswer[controller.selectQuest.value] !=
              index + 1
          ? Colors.white
          : UtilColor.buttonBlue,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '${answer.content}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color:
                controller.listQuestionAnswer[controller.selectQuest.value] !=
                        index + 1
                    ? Colors.black
                    : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget numberQuestion(int index) {
    return Card(
      color: controller.listQuestionAnswer[index] != 0
          ? Colors.blue[300]
          : Colors.white,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Text(
          '${index + 1}',
          style: TextStyle(
              color: controller.selectQuest.value == index
                  ? UtilColor.textRed
                  : Colors.black,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
