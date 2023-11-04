import 'package:agriculture/Controller/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});
  Size size = Size(0, 0);

  final delete = Get.delete<LoginController>();
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/vnua.jpg'),
                fit: BoxFit.cover)),
        child: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Get.arguments != 1
                      ? Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(
                              top: 40, left: 20, bottom: 15),
                          child: Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Icon(Icons.arrow_back_outlined)),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Đăng Nhập',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          margin: const EdgeInsets.only(top: 60),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(children: [
                            textField(),
                            textFieldPass(),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Chưa có tài khoản?'),
                                  Text(
                                    'Đăng ký',
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: Obx(
              () => GestureDetector(
                onTap: () {
                  if (controller.isPassNull.value == false &&
                      controller.isUserNull.value == false) {
                    controller.login();
                  }
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: controller.isPassNull.value == false &&
                              controller.isUserNull.value == false
                          ? Colors.blue
                          : const Color.fromARGB(255, 220, 221, 225),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Center(
                      child: Text(
                    'Đăng nhập',
                    style: TextStyle(
                        fontSize: 14,
                        color: controller.isPassNull.value == false &&
                                controller.isUserNull.value == false
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget textField() {
    return Column(
      children: [
        Row(children: [
          const Icon(Icons.person_sharp),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: TextField(
              onChanged: (value) {
                if (value != '') {
                  controller.isUserNull.value = false;
                } else {
                  controller.isUserNull.value = true;
                }
              },
              controller: controller.user,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Nhập tên đăng nhập'),
            ),
          ),
        ]),
        Container(
          height: 1,
          color: const Color(0xffF0F4F9),
        )
      ],
    );
  }

  Widget textFieldPass() {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              const Icon(Icons.lock),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: TextField(
                  onChanged: (value) {
                    if (value != '') {
                      controller.isPassNull.value = false;
                    } else {
                      controller.isPassNull.value = true;
                    }
                  },
                  controller: controller.pass,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Nhập mật khẩu'),
                  obscureText: controller.isHidePass.value,
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.showPass();
                },
                child: controller.isHidePass.value
                    ? SvgPicture.asset(
                        'assets/icons/hide_eye.svg',
                        height: 20,
                        width: 20,
                        color: Colors.black,
                      )
                    : SvgPicture.asset(
                        'assets/icons/show_eye.svg',
                        height: 20,
                        width: 20,
                        color: Colors.black,
                      ),
              ),
            ],
          ),
        ),
        Container(
          height: 1,
          color: const Color(0xffF0F4F9),
        )
      ],
    );
  }
}
