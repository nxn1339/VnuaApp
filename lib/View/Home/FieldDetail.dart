import 'package:agriculture/Controller/Home/FieldDetailController.dart';
import 'package:agriculture/Model/MDField.dart';
import 'package:agriculture/Utils/UtilColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FieldDetail extends StatelessWidget {
  FieldDetail({super.key});
  final delete = Get.delete<FieldDetailController>();
  final controller = Get.put(FieldDetailController());
  Size size = Size(0, 0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chuyên ngành',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Container(
        width: size.width,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => RichText(
                      text: TextSpan(
                          children: [
                        const TextSpan(text: 'Các chuyên ngành của: '),
                        TextSpan(
                            text: controller.nameField.value,
                            style: TextStyle(color: UtilColor.textRed)),
                      ],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black))),
                ),
                Obx(() => Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.specialized.length,
                              itemBuilder: (context, index) {
                                return cardSpecialized(
                                    controller.specialized[index]);
                              }),
                        ),
                      ],
                    )),
              ],
            )))
          ],
        ),
      ),
    );
  }

  Widget cardSpecialized(Specialized specialized) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Text(
                        'Tên chuyên ngành:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                          child: Text(
                        '${specialized.name}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: UtilColor.textBlue),
                      )),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Text(
                        'Loại đào tạo:',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                          child: Text(
                        '${trainingName(specialized.type ?? 0)}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: trainingColor(specialized.type ?? 0)),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String trainingName(int type) {
    switch (type) {
      case 0:
        return 'Thường';
      case 1:
        return 'Tiên tiến (Eng)';
      case 2:
        return 'Chất lượng cao (Eng)';
      case 3:
        return 'Hướng nghiệp (Pohe)';
      default:
        return 'Thường';
    }
  }

  Color? trainingColor(int type) {
    switch (type) {
      case 0:
        return UtilColor.textGreen;
      case 1:
        return UtilColor.textBlue;
      case 2:
        return UtilColor.textPurple;
      case 3:
        return UtilColor.textOrange;
      default:
        return UtilColor.textGreen;
    }
  }
}
