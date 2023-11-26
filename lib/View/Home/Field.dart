import 'package:agriculture/Controller/Home/FieldController.dart';
import 'package:agriculture/Navigation/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Field extends StatelessWidget {
  Field({super.key});
  Size size = Size(0, 0);
  final delete = Get.delete<FieldController>();
  final controller = Get.put(FieldController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ngành đào tạo',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Obx(
                    () => ListView.builder(
                        itemCount: controller.listField.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigation.navigateTo(
                                  page: 'FieldDetail',
                                  arguments: {
                                    'field': controller.listField[index].name,
                                    'specialized':
                                        controller.listField[index].specialized
                                  });
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Card(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text('${index + 1}.'),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${controller.listField[index].name}',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
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
                  ),
                ),
              )
            ],
          )),
    );
  }
}
