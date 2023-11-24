import 'package:agriculture/Controller/Profile/ProfileController.dart';
import 'package:agriculture/Navigation/Navigation.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/UtilColor.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Profile({super.key});
  Size size = Size(0, 0);

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.refreshData();
                  return Future.delayed(
                    Duration(seconds: 1),
                    () {},
                  );
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget logged() {
    return Column(
      children: [
        ClipOval(
          child: Image.network(
            '${APICaller.getInstance().BASE_URL}${controller.avatar.value}',
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                  color: Colors.black12,
                  height: 100,
                  width: 100,
                  child: const Icon(Icons.question_mark_sharp));
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          '${controller.name}',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          controller.permissionName.value,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: UtilColor.textBlue),
        ),
        const SizedBox(
          height: 4,
        ),
        Text('${controller.email}'),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigation.navigateTo(page: 'ProfileDetail');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: const Text(
              'Chỉnh sửa',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        controller.permission.value != 3
            ? cardItem(const Icon(Icons.mail_outline), 'Hòm thư', () {
                Navigation.navigateTo(page: 'MailBox');
              })
            : Container(),
        cardItem(const Icon(Icons.key), 'Đổi mật khẩu', () {}),
        cardItem(const Icon(Icons.error_outline), 'Thông tin ứng dụng', () {}),
        cardItem(const Icon(Icons.logout), 'Đăng xuất', () {
          Utils.showDialog(
            title: 'Đăng xuất',
            content: const Text('Bạn có muốn đăng xuất không ?'),
            textConfirm: 'Đăng xuất',
            textCancel: 'Quay lại',
            confirmTextColor: Colors.white,
            onConfirm: () {
              controller.logOut();
              Get.back();
            },
            onCancel: () {
              Get.back();
            },
          );
        }),
      ],
    );
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
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: const Text('Đăng nhập')),
          ),
        )
      ],
    );
  }

  Widget cardItem(Icon icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon,
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_right,
                  size: 20,
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 1,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
