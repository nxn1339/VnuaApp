import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizzeDetail extends StatelessWidget {
  const QuizzeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments['title'],
          style: const TextStyle(color: Colors.black),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
