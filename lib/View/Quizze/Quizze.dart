import 'package:agriculture/Controller/Quizze/QuizzeController.dart';
import 'package:agriculture/Model/Quizze/MDPackage.dart';
import 'package:agriculture/Navigation/Navigation.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Quizze extends StatelessWidget {
  Quizze({super.key});
  final delete = Get.delete<QuizzeController>();
  final controller = Get.put(QuizzeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Trắc nghiệm',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.listPackage.length,
                    itemBuilder: (context, index) {
                      return packQuizze(controller.listPackage[index], () {
                        Navigation.navigateTo(page: 'QuizzeDetail', arguments: {
                          'title': controller.listPackage[index].name,
                          'id': controller.listPackage[index].id
                        });
                      });
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget packQuizze(MDPackage mdPackage, VoidCallback voidCallback) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(width: 1, color: Colors.black38)),
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ExpansionTile(
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mdPackage.name.toString(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // RichText(
                    //     text: TextSpan(
                    //         children: [
                    //       const TextSpan(
                    //           text: 'Số câu hỏi: ',
                    //           style: TextStyle(color: Colors.blue)),
                    //       TextSpan(
                    //           text: questionNumber,
                    //           style: const TextStyle(color: Colors.red))
                    //     ],
                    //         style: const TextStyle(
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w500,
                    //             color: Colors.black))),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    RichText(
                        text: TextSpan(
                            children: [
                          const TextSpan(
                              text: 'Thời gian làm: ',
                              style: TextStyle(color: Colors.blue)),
                          TextSpan(
                              text: '${mdPackage.time} phút',
                              style: const TextStyle(color: Colors.red))
                        ],
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                  ],
                ),
              ),
              Image.network(
                '${APICaller.getInstance().BASE_URL}${mdPackage.avatar}',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object object,
                    StackTrace? stackTrace) {
                  return const Icon(
                    Icons.question_mark,
                    size: 70,
                  );
                },
              )
            ],
          ),
          children: [
            Text(mdPackage.description.toString()),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: voidCallback,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: const Text(
                  'Làm Bài',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
