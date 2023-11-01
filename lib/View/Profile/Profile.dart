import 'package:agriculture/Controller/ProfileController.dart';
import 'package:agriculture/Navigation/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  Size size = Size(0, 0);
  final delete = Get.delete<ProfileController>();
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cá nhân',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(
                      () => controller.isLogin.value == false
                          ? noLogin(context)
                          : logged(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget logged() {
    return Container();
  }

  Widget noLogin(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(bottom: 20),
      title: const Text('Thông báo'),
      content: const Text('Bạn chưa đăng nhập để dùng tính năng này.'),
      actions: [
        Center(
          child: GestureDetector(
            onTap: () {
              Navigation.navigateTo(page: 'Login', arguments: 2);
            },
            child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Text('Đăng nhập')),
          ),
        )
      ],
    );
  }
}
