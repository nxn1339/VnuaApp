import 'package:agriculture/Controller/Profile/ProfileDetailController.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/UtilColor.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
          GestureDetector(
            onTap: () {
              controller.updateProfile();
            },
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.save,
                  color: UtilColor.textBlue,
                )),
          )
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
                child: Obx(
                  () => Column(
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
                          GestureDetector(
                            onTap: () {
                              showDialogPickImage(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.black38),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(150))),
                              height: 120,
                              width: 120,
                              child: ClipOval(
                                child: controller.imageFile.isEmpty
                                    ? Image.network(
                                        '${APICaller.getInstance().BASE_URL}${controller.avt.value}',
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(
                                            Icons.question_mark,
                                            size: 70,
                                          );
                                        },
                                      )
                                    : Image.file(
                                        controller.imageFile.first,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Icon(
                                            Icons.question_mark,
                                            size: 70,
                                          );
                                        },
                                      ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                hintText: 'Họ tên của bạn',
                                maxLines: 1,
                                controller: controller.name),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Ngày sinh',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                            GestureDetector(
                              onTap: () {
                                controller.selectDate(context);
                              },
                              child: Utils.textField(
                                  maxLines: 1,
                                  icon: const Icon(Icons.cake),
                                  enabled: false,
                                  style: const TextStyle(color: Colors.black),
                                  hintText: DateFormat('dd/MM/yyyy')
                                      .format(DateTime.now()),
                                  controller: controller.date),
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
                                  radioButton('Nam', 1),
                                  radioButton('Nữ', 2),
                                  radioButton('Khác', 3),
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
                                maxLines: 1,
                                icon: const Icon(Icons.phone),
                                hintText: 'VD: 0987654321',
                                textInputType: TextInputType.number,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                controller: controller.phoneNumber),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('Email',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                            Utils.textField(
                                maxLines: 1,
                                icon: const Icon(Icons.mail),
                                hintText: 'VD: abc@gmail.com',
                                style: const TextStyle(color: Colors.black38),
                                controller: controller.email,
                                enabled: false),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget radioButton(String title, int value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: controller.idGender.value,
          onChanged: (value) {
            controller.setGender(value!);
          },
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  showDialogPickImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // Return the BottomSheet widget
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Chọn ảnh từ:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Máy ảnh'),
                  onTap: () {
                    controller.getImage(1);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.folder),
                  title: Text('Thư mục'),
                  onTap: () {
                    controller.getImage(2);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
