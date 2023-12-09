import 'package:agriculture/Components/New.dart';
import 'package:agriculture/Controller/Home/HomeController.dart';
import 'package:agriculture/Model/MDSlide.dart';
import 'package:agriculture/Navigation/Navigation.dart';
import 'package:agriculture/Utils/UtilColor.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  Home({super.key});
  Size size = Size(0, 0);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controller.chekcDeleteController();
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 100,
        backgroundColor: Color(0xFF002D4A),
        title: _appBar(context),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.refreshData();
                  //đợi 1s sau mới refresh được tiếp
                  return Future<void>.delayed(const Duration(seconds: 1));
                },
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          child: Marquee(
                            text:
                                ' HỌC VIỆN NÔNG NGHIỆP VIỆT NAM - CƠ HỘI HỌC TẬP VÀ THÀNH ĐẠT',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            blankSpace: 20.0,
                            velocity: 50.0,
                            pauseAfterRound: const Duration(seconds: 1),
                            startPadding: 10.0,
                            accelerationDuration: const Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration:
                                const Duration(milliseconds: 500),
                            decelerationCurve: Curves.easeOut,
                          ),
                        ),
                        Obx(
                          () => Padding(
                              padding: const EdgeInsets.all(20),
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CarouselSlider(
                                        items: generateImagesTitles(
                                            images: controller.listSlide,
                                            size: size),
                                        options: CarouselOptions(
                                            height: 150,
                                            viewportFraction: 1.0,
                                            enlargeCenterPage: false,
                                            autoPlay: true,
                                            autoPlayInterval:
                                                const Duration(seconds: 3),
                                            onPageChanged: (index, other) {
                                              controller.setActiveIndex(index);
                                            })),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Center(
                                        child: AnimatedSmoothIndicator(
                                          activeIndex:
                                              controller.activeIndex.value,
                                          count: controller.listSlide.length,
                                          effect: const ExpandingDotsEffect(
                                            dotWidth: 8,
                                            dotHeight: 8,
                                            activeDotColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ])),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _menu(
                                  'assets/icons/graduation_cap.svg',
                                  'Trắc nghiệm',
                                  const Color(0xff1560BD),
                                  () {}),
                              const SizedBox(
                                width: 5,
                              ),
                              _menu('assets/icons/mail.svg', 'Gửi tư vấn',
                                  const Color(0xffD24B66), () {
                                _showBottomDialog(context);
                              }),
                              const SizedBox(
                                width: 5,
                              ),
                              _menu(
                                'assets/icons/majors.svg',
                                'Ngành đào tạo',
                                const Color(0xff00CAB1),
                                () {
                                  Navigation.navigateTo(page: 'Field');
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 4,
                          color: Color(0xffFF9F00),
                        ),
                        Container(
                          height: 4,
                          color: Color(0xff006343),
                        ),
                        Container(
                          height: 4,
                          color: Color(0xff533535),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Tin tức & sự kiện',
                                  style: TextStyle(
                                      color: Color(0xff009B6B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                    color: Color(0xffcceeff),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigation.navigateTo(page: 'NewAll');
                                  },
                                  child: const Text(
                                    'Xem thêm',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF0060AF),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => controller.isLoading.value
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.listNew.length,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      alignment: Alignment.topLeft,
                                      fit: StackFit.passthrough,
                                      children: [
                                        New(
                                          newObject: controller.listNew[index],
                                          onTap: () {
                                            Navigation.navigateTo(
                                                page: 'NewDetail',
                                                arguments: {
                                                  'id': controller
                                                      .listNew[index].id
                                                });
                                          },
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 20),
                                          child: Obx(() {
                                            return Text(
                                              'New',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: controller
                                                          .isBlinking.value
                                                      ? Colors.red
                                                      : Colors.yellow,
                                                  fontWeight: FontWeight.w700),
                                            );
                                          }),
                                        )
                                      ],
                                    );
                                  },
                                ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return Container(
      color: const Color(0xFF002D4A),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'HỌC VIỆN NÔNG NGHIỆP VIỆT NAM',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Vietnam National\nUniversity of Agriculture'.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _menu(String icon, title, Color color, VoidCallback voidCallback) {
    return Expanded(
      child: GestureDetector(
        onTap: voidCallback,
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(6))),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 24,
                width: 24,
                color: Colors.white,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> generateImagesTitles(
      {required List<MDSlide> images, required Size size}) {
    return images
        .map((e) => ClipRRect(
              child: Image.network(
                width: size.width,
                e.avatar.toString(),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ))
        .toList();
  }

  //show tư vấn
  void _showBottomDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  height: 5,
                  width: size.width * 0.3,
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.close))),
              Utils.textField(
                controller: controller.textEditName,
                icon: const Icon(Icons.abc),
                hintText: 'Nhập tên',
                onChanged: (value) {
                  controller.resetValidate(value);
                },
              ),
              Obx(() => Text(
                    '${controller.textValidateName.value}',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: UtilColor.textRed),
                  )),
              const SizedBox(
                height: 10,
              ),
              Utils.textField(
                controller: controller.textEditPhoneNumber,
                icon: Icon(Icons.phone),
                hintText: 'Nhập số điện thoại',
                textInputType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  controller.resetValidate(value);
                },
              ),
              Obx(() => Text(
                    '${controller.textValidatePhoneNumber.value}',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: UtilColor.textRed),
                  )),
              const SizedBox(
                height: 10,
              ),
              Utils.textField(
                  controller: controller.textEditEmail,
                  icon: const Icon(Icons.mail),
                  hintText: 'Nhập email',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 10,
              ),
              Utils.textFieldMuti(
                controller: controller.textEditContent,
                icon: const Icon(Icons.comment_rounded),
                hintText: 'Nhập nội dung',
                textInputType: TextInputType.multiline,
                onChanged: (value) {
                  controller.resetValidate(value);
                },
              ),
              Obx(() => Text(
                    '${controller.textValidateContent.value}',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: UtilColor.textRed),
                  )),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.checkValidate() == true) {
                      controller.sendConsultation();
                    }
                  },
                  child: const Text('Gửi'),
                ),
              ),
            ],
          ),
        );
      },
    ).whenComplete(() => controller.resetEditText());
  }
}
