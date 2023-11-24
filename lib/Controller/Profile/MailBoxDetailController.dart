import 'package:agriculture/Model/MDAdviseDetail.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MailBoxDetailController extends GetxController {
  Rx<MDAdviseDetail> adviseDetail = MDAdviseDetail().obs;
  @override
  void onReady() {
    super.onReady();
    adviseDetail.value = Get.arguments['advise'];
  }

  void makePhoneCall() async {
    String phoneNumber = 'tel:${adviseDetail.value.phone}';

    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      print('Không thể gọi điện');
    }
  }

  void sendSms() async {
    String smsNumber = 'sms:${adviseDetail.value.phone}';

    if (await canLaunch(smsNumber)) {
      await launch(smsNumber);
    } else {
      print('Không thể gửi SMS');
    }
  }

  void sendEmail() async {
    if (adviseDetail.value.email != '') {
      String? encodeQueryParameters(Map<String, String> params) {
        return params.entries
            .map((MapEntry<String, String> e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
            .join('&');
      }

      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: '${adviseDetail.value.email}',
        query: encodeQueryParameters(<String, String>{
          'subject': 'Phản Hồi Tư Vấn!',
        }),
      );

      launchUrl(emailLaunchUri);
    } else {
      Utils.showSnackBar(
          title: 'Thông Báo', message: 'Người tư vấn không để lại email !');
    }
  }
}
