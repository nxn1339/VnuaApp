import 'package:agriculture/Controller/Profile/ProfileDetailController.dart';
import 'package:agriculture/Utils/UtilColor.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetail extends StatelessWidget {
  ProfileDetail({super.key});
  Size size = Size(0, 0);
  var delete = Get.delete<ProfileDetailController>();
  final controller = Get.put(ProfileDetailController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.save,
                color: UtilColor.textBlue,
              ))
        ],
      ),
      body: Container(
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(children: [
                        const Text(
                          'Chỉnh sửa',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: ClipOval(
                            child: Image.network(
                              'https://cdn.diemnhangroup.com/seoulcenter/2022/11/gai-xinh-1.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.question_mark,
                                  size: 70,
                                );
                              },
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Tên',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Utils.textField(
                              icon: const Icon(Icons.abc),
                              hintText: 'Họ tên của bạn'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Ngày sinh',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                controller.selectDate(context);
                              },
                              child: Utils.textField(
                                  icon: const Icon(Icons.cake),
                                  enabled: false,
                                  hintText: controller.date.value),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Giới tính',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Obx(
                            () => Row(
                              children: [
                                radioButton('Nam'),
                                radioButton('Nữ'),
                                radioButton('Khác'),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('SĐT',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Utils.textField(
                              icon: const Icon(Icons.phone),
                              hintText: 'VD: 0987654321'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Email',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Utils.textField(
                              icon: const Icon(Icons.mail),
                              hintText: 'VD: abc@gmail.com'),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget radioButton(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Radio(
          value: title,
          groupValue: controller.gender.value,
          onChanged: (value) {
            controller.setGender(value!);
          },
        ),
      ],
    );
  }
}
