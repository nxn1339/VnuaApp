import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class Recruitment extends StatelessWidget {
  Recruitment({super.key});
  Size size = Size(0, 0);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tuyển dụng',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        mini: true,
        child: const Icon(Icons.add), // Đặt nút thành phiên bản nhỏ
      ),
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(50))),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      'https://haycafe.vn/wp-content/uploads/2022/02/Anh-gai-xinh-de-thuong-577x600.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const Text('Đăng bài tuyển dụng ?'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          SvgPicture.asset(
                            'assets/icons/picture-svgrepo-com.svg',
                            height: 30,
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      color: Colors.black12,
                      height: 4,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    recruitment(),
                    recruitment(),
                    recruitment(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recruitment() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        'https://haycafe.vn/wp-content/uploads/2022/02/Anh-gai-xinh-de-thuong-577x600.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  const Text(
                    'Nguyễn Xuân Ngát',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                'Công ty: Vinfast',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'Nhân Viên Chăm Sóc Khách Hàng [Hà Nội / HCM]',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[300]),
              ),
              const SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(
                    children: [
                      const TextSpan(text: 'Mức lương: '),
                      TextSpan(
                          text: '8 - 15 triệu',
                          style: TextStyle(color: Colors.green[400]))
                    ],
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 6,
              ),
              RichText(
                text: TextSpan(
                    children: [
                      const TextSpan(text: 'Chức vụ: '),
                      TextSpan(
                          text: 'Chuyên viên - nhân viên',
                          style: TextStyle(color: Colors.blue[400]))
                    ],
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                  'Công ty Cổ phần Phát triển Kinh doanh Thịnh Phát tuyển dụng 10 Nhân viên Chăm sóc Khách hàng tại các địa điểm sau:\n+ Hà Nội: Tòa Nhà Central Point, 219 Trung Kính, Yên Hòa, Cầu Giấy+ TPHCM: Tầng 4 tòa nhà Dali Tower, 24C Phan Đăng Lưu, Phường 6, Quận Bình ThạnhCông việc bạn cần thực hiện:\n- Tiếp nhận nhu cầu, tư vấn và hướng dẫn khách hàng về các sản phẩm thẻ tín dụng của ngân hàng VPBank.\n- Khai thác hiệu quả nguồn dữ liệu khách hàng sẵn có do công ty cung cấp.\n- Kiểm tra, hướng dẫn khách hàng cung cấp các giấy tờ và làm thủ tục theo quy định.\n- Giải đáp nhanh chóng, kịp thời và chính xác những thắc mắc của khách hàng.\n- Thực hiện các công việc khác theo phân công của cấp quản lý.'),
              const SizedBox(
                height: 6,
              ),
              Image.network(
                'https://vuinhiepanh.com/assets/uploads/2017/11/14-2.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return SvgPicture.asset('assets/icons/error-svgrepo-com.svg');
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black38))),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/comment-dots.svg'),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Bình luận',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          color: Colors.black12,
          height: 4,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
