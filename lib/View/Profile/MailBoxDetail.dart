import 'package:agriculture/Controller/Profile/MailBoxDetailController.dart';
import 'package:agriculture/Utils/UtilColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MailBoxDetail extends StatelessWidget {
  MailBoxDetail({super.key});
  var delete = Get.delete<MailBoxDetailController>();
  final controller = Get.put(MailBoxDetailController());

  Size size = Size(0, 0);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chi tiết thư tư vấn',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.3,
      ),
      body: Container(
        color: Colors.white,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Obx(() => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tên: ${controller.adviseDetail.value.name ?? ''}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Số Điện Thoại: ${controller.adviseDetail.value.phone ?? ''}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: UtilColor.textRed,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Email: ${controller.adviseDetail.value.email == '' ? 'Không có' : controller.adviseDetail.value.email}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: UtilColor.textBlue,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Nội dung: ${controller.adviseDetail.value.content}',
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      _showDialogSend(context);
                                    },
                                    icon: const Icon(Icons.contact_emergency),
                                    label: const Text('Liên Hệ')),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showDialogSend(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.call),
                title: Text('Gọi Điện'),
                onTap: () {
                  Get.back();
                  controller.makePhoneCall();
                },
              ),
              ListTile(
                leading: Icon(Icons.sms),
                title: Text('Nhắn tin'),
                onTap: () {
                  Get.back();
                  controller.sendSms();
                },
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                onTap: () {
                  Get.back();
                  controller.sendEmail();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
