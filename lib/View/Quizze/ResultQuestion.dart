import 'package:agriculture/Controller/Quizze/ResultQuestionController.dart';
import 'package:agriculture/Navigation/Navigation.dart';
import 'package:agriculture/Utils/UtilColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: FloatingActionButton(
          mini: true,
          onPressed: () {
            Navigation.navigateGetOffAll(page: 'Dashboard');
          },
          child: Icon(Icons.home),
        ),
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
                                      'D: ${controller.resultQuestion.value.base?.most?.s1}'),
                                  Text(
                                      'I: ${controller.resultQuestion.value.base?.most?.s2}'),
                                  Text(
                                      'S: ${controller.resultQuestion.value.base?.most?.s3}'),
                                  Text(
                                      'C: ${controller.resultQuestion.value.base?.most?.s4}')
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
                                      'D: ${controller.resultQuestion.value.base?.least?.s1}'),
                                  Text(
                                      'I: ${controller.resultQuestion.value.base?.least?.s2}'),
                                  Text(
                                      'S: ${controller.resultQuestion.value.base?.least?.s3}'),
                                  Text(
                                      'C: ${controller.resultQuestion.value.base?.least?.s4}')
                                ],
                              ),
                            ),
                          ],
                        ),
                        Html(
                            data:
                                '${controller.resultQuestion.value.result?.content}'),
                        Html(
                            data:
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
                                  return GestureDetector(
                                    onTap: () {
                                      Navigation.navigateTo(
                                          page: 'FieldDetail',
                                          arguments: {
                                            'field': controller.resultQuestion
                                                .value.field?[index].name,
                                            'specialized': controller
                                                .resultQuestion
                                                .value
                                                .field?[index]
                                                .specialized
                                          });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Card(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
