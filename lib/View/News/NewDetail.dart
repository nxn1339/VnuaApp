import 'package:agriculture/Controller/NewDetailController.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewDetail extends StatelessWidget {
  NewDetail({super.key});
  var delete = Get.delete<NewDetailController>();
  var controller = Get.put(NewDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết tin tức'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.3,
      ),
      body: Obx(
        () => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      color: Color(0xffcceeff),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Text(
                    '${controller.mdNew.value.description}',
                    style: TextStyle(
                        color: Color(0xFF0060AF),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${controller.mdNew.value.title}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      runSpacing: 10,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/clock.svg',
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(DateTime.parse(
                              controller.mdNew.value.publishDate ??
                                  DateTime.now().toString())),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xFF788A9B)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Text(
                      'Tác giả: ${controller.mdNew.value.author}',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.network(
                    '${APICaller.getInstance().BASE_URL_IMAGE}${controller.mdNew.value.image}',
                    fit: BoxFit.cover, errorBuilder: (BuildContext context,
                        Object exception, StackTrace? stackTrace) {
                  return Icon(
                    Icons.question_mark_rounded,
                    size: 70,
                  );
                }),
                SizedBox(
                  height: 12,
                ),
                Html(data: controller.mdNew.value.content),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isNumeric(String str) {
    return int.tryParse(str) != null || double.tryParse(str) != null;
  }
}
