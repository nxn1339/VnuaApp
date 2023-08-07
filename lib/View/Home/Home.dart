import 'package:agriculture/Components/New.dart';
import 'package:agriculture/Controller/HomeController.dart';
import 'package:agriculture/Model/MDSlide.dart';
import 'package:agriculture/Navigation/Navigation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatelessWidget {
  Home({super.key});
  var delete = Get.delete<HomeController>();
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Color(0xFF002D4A),
        title: _appBar(context),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
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
                          decelerationDuration: const Duration(milliseconds: 500),
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
                          children: [
                            Expanded(
                                child: _menu('assets/icons/loudspeaker.svg',
                                    'Tuyển sinh Đại học', Color(0xff53373A))),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: _menu('assets/icons/student.svg',
                                  'Học bổng - Việc làm', Color(0xff006343)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: _menu('assets/icons/study.svg',
                                  'Kết quả nghiên cứu', Color(0xffFF9700)),
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
                            const Text(
                              'Tin tức & sự kiện',
                              style: TextStyle(
                                  color: Color(0xff009B6B),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
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
                        () => SizedBox(
                          height: size.height * 0.21,
                          width: size.width,
                          child: Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.listNew.length,
                              itemBuilder: (context, index) {
                                return New(
                                  newObject: controller.listNew[index],
                                  onTap: () {
                                    //tăng view
                                    // controller.readNew(index);
                                    //chuyển sang màn chi tiết
                                    Navigation.navigateTo(
                                        page: 'NewDetail',
                                        arguments: [controller.listNew[index].id]);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ]),
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

  _menu(String icon, title, Color color) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: const BorderRadius.all(Radius.circular(6))),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: 24,
            width: 24,
            color: Colors.white,
          ),
          const SizedBox(
            width: 3,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
              overflow: TextOverflow.clip,
            ),
          ),
        ],
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
}
