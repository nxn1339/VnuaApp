import 'package:agriculture/Components/New.dart';
import 'package:agriculture/Controller/NewAllController.dart';
import 'package:agriculture/Navigation/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NewAll extends StatelessWidget {
  NewAll({super.key});
  var delete = Get.delete<NewAllController>();
  var controller = Get.put(NewAllController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tin Tức',
          style: TextStyle(color: Colors.black),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 45,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Color(0xFFEAEEF3))),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      'assets/icons/search-normal.svg',
                      width: 17,
                      height: 17,
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      // controller: newController.textSearchData.value,
                      onChanged: (value) {
                        // newController.onSearchChanged();
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0.0),
                        hintText: 'Nhập từ khóa tìm kiếm',
                        hintStyle: TextStyle(
                            color: Color(0xFF99A2B3),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                          color: Color(0xFF2F3643),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                width: 1,
                                color: Color.fromRGBO(225, 229, 237, 1)))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SvgPicture.asset(
                          'assets/icons/document-filter.svg',
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
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
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: controller.listNew.length,
                            itemBuilder: (context, index) {
                              return New(
                                newObject: controller.listNew[index],
                                onTap: () {
                                  controller.readNew(index);
                                  Navigation.navigateTo(
                                      page: 'NewDetail',
                                      arguments: [controller.listNew[index].id]);
                                },
                              );
                            },
                          ),
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
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          )),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
