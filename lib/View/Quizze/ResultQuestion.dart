import 'package:agriculture/Controller/Quizze/ResultQuestionController.dart';
import 'package:agriculture/Utils/UtilColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultQuestion extends StatelessWidget {
  ResultQuestion({super.key});
  var delete = Get.delete<ResultQuestionController>();
  final controller = Get.put(ResultQuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kết quả của bạn',
          style: const TextStyle(color: Colors.black),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(
                    () => Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Most'),
                                  Text(
                                      'D: ${controller.resultQuestion.value.base1?.most?.s1}'),
                                  Text(
                                      'I: ${controller.resultQuestion.value.base1?.most?.s2}'),
                                  Text(
                                      'S: ${controller.resultQuestion.value.base1?.most?.s3}'),
                                  Text(
                                      'C: ${controller.resultQuestion.value.base1?.most?.s4}')
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Least'),
                                  Text(
                                      'D: ${controller.resultQuestion.value.base1?.least?.s1}'),
                                  Text(
                                      'I: ${controller.resultQuestion.value.base1?.least?.s2}'),
                                  Text(
                                      'S: ${controller.resultQuestion.value.base1?.least?.s3}'),
                                  Text(
                                      'C: ${controller.resultQuestion.value.base1?.least?.s4}')
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                            'Nhóm: ${controller.resultQuestion.value.result?.id}'),
                        Text('${controller.resultQuestion.value.result?.name}'),
                        Text(
                            '${controller.resultQuestion.value.result?.content}'),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Dưới đây là các ngành phù hợp với bạn',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: UtilColor.textBlue),
                        ),
                        controller.resultQuestion.value.field!.isEmpty
                            ? Container()
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller
                                    .resultQuestion.value.field?.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Card(
                                              child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text('${index + 1}.'),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${controller.resultQuestion.value.field?[index].name}',
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
