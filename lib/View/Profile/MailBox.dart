import 'package:agriculture/Controller/Profile/MailBoxController.dart';
import 'package:agriculture/Model/MDAdvise.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MailBox extends StatelessWidget {
  MailBox({super.key});
  var delete = Get.delete<MailBoxController>();
  final controller = Get.put(MailBoxController());
  Size size = Size(0, 0);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hòm thư',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Obx(
        () => Container(
            color: Colors.white,
            child: controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.refreshData();
                      return Future.delayed(
                        const Duration(seconds: 1),
                      );
                    },
                    child: ListView.builder(
                      controller: controller.scrollController.value,
                      itemCount: controller.listAdvise.length,
                      itemBuilder: (context, index) {
                        if (index == controller.listAdvise.length - 1 &&
                            controller.total != controller.listAdvise.length &&
                            controller.listAdvise.length > 11) {
                          return const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            ),
                          );
                        }
                        return GestureDetector(onTap: () {
                           controller.readMailBox(index);
                        },child: cardAdvise(controller.listAdvise[index]));
                      },
                    ),
                  )),
      ),
    );
  }

  Widget cardAdvise(MDAdvise advise) {
    return Container(
      color: advise.isReaded == 0 ? Colors.grey[200] : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tên: ${advise.name}',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'SĐT: ${advise.phone}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Ngày Gửi: ${DateFormat('HH:mm  dd-MM-yyyy').format(DateTime.parse(advise.createAt.toString()))}',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
