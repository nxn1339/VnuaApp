import 'package:agriculture/Components/New.dart';
import 'package:agriculture/Controller/New/NewDetailController.dart';
import 'package:agriculture/Service/APICaller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewDetail extends StatelessWidget {
  NewDetail({super.key});
  var delete = Get.delete<NewDetailController>();
  final controller = Get.put(NewDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết tin tức'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: true,
        elevation: 0.3,
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                                color: Color(0xffcceeff),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Text(
                              '${controller.mdNew.value.title}',
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
                            '${controller.mdNew.value.description}',
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
                                  controller.mdNew.value.createAt != null
                                      ? Text(
                                          DateFormat('dd/MM/yyyy').format(
                                              DateTime.parse(controller
                                                      .mdNew.value.createAt ??
                                                  DateTime.now().toString())),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Color(0xFF788A9B)),
                                        )
                                      : Text(
                                          'Đang cập nhật',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Color(0xFF788A9B)),
                                        ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              Text(
                                'Tác giả: ${controller.mdNew.value.author}',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.network(
                              '${APICaller.getInstance().BASE_URL}${controller.mdNew.value.image}',
                              fit: BoxFit.cover, errorBuilder:
                                  (BuildContext context, Object exception,
                                      StackTrace? stackTrace) {
                            return Icon(
                              Icons.question_mark_rounded,
                              size: 70,
                            );
                          }),
                          SizedBox(
                            height: 12,
                          ),
                          Html(data: '${controller.mdNew.value.content}'),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 3,
                      color: Colors.grey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'TIN KHÁC',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff009966)),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => controller.isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : controller.listNew.length != 0
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: controller.listNew.length,
                                      itemBuilder: (context, index) {
                                        return New(
                                          newObject: controller.listNew[index],
                                          onTap: () {
                                            controller.getNews(
                                                controller.listNew[index].id ??
                                                    '');
                                            controller.scrollToTop();
                                          },
                                        );
                                      },
                                    )
                                  : Container(
                                      child: Center(
                                          child: Column(
                                        children: [
                                          Container(
                                            height: 300,
                                            width: 250,
                                            child: SvgPicture.asset(
                                              'assets/images/not_data.svg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            'Không có dữ liệu vui lòng thử lại sau !',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      )),
                                    ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isNumeric(String str) {
    return int.tryParse(str) != null || double.tryParse(str) != null;
  }
}
