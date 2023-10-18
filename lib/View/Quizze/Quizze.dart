import 'package:agriculture/Navigation/Navigation.dart';
import 'package:flutter/material.dart';

class Quizze extends StatelessWidget {
  const Quizze({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    packQuizze(
                        'Test tính cách',
                        '32',
                        '40',
                        'assets/images/test1.png',
                        'MBTI là cách viết ngắn gọn của Chỉ số phân loại Myers-Briggs (Myers-Briggs Type Indication), là một phương pháp sử dụng các câu hỏi trắc nghiệm tâm lý để tìm hiểu tâm lý, tính cách cũng như cách con người nhận thức thế giới xung quanh, đưa ra quyết định cho một vấn đề...',
                        () {
                      Navigation.navigateTo(
                          page: 'QuizzeDetail',
                          arguments: {'title': 'Test tính cách'});
                    }),
                    packQuizze(
                        'Test đa trí thông minh',
                        '90',
                        '20',
                        'assets/images/test2.png',
                        'Trắc nghiệm đa trí thông minh MI (Multiple Intelligences) là phương pháp đánh giá trí thông minh nổi trội của mỗi người, dựa trên Lý thuyết đa trí thông minh (Theory of Multiple Intelligences) nghiên cứu bởi Giáo sư Tâm lý học Howard Gardner.',
                        () {
                      Navigation.navigateTo(
                          page: 'QuizzeDetail',
                          arguments: {'title': 'Test đa trí thông minh'});
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget packQuizze(String title, String questionNumber, String time,
      String img, String content, VoidCallback voidCallback) {
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
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(
                            children: [
                          const TextSpan(
                              text: 'Số câu hỏi: ',
                              style: TextStyle(color: Colors.blue)),
                          TextSpan(
                              text: questionNumber,
                              style: const TextStyle(color: Colors.red))
                        ],
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(
                            children: [
                          const TextSpan(
                              text: 'Thời gian làm: ',
                              style: TextStyle(color: Colors.blue)),
                          TextSpan(
                              text: '$time phút',
                              style: const TextStyle(color: Colors.red))
                        ],
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                  ],
                ),
              ),
              Image.asset(
                img,
                height: 120,
                width: 120,
              )
            ],
          ),
          children: [
            Text(content),
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
