import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isLogin = false.obs;
  String uuid = '';
  RxString avatar = ''.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadSavedText();
    fetchProfile();
  }

  void loadSavedText() async {
    uuid = await Utils.getStringValueWithKey('id');
    if (uuid.isNotEmpty) {
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }
  }

  void fetchProfile() async {
    try {
      var response = await APICaller.getInstance()
          .get('user/${await Utils.getStringValueWithKey('id')}');
      if (response != null) {
        avatar.value = response['data']['avatar'];
        name.value = response['data']['name'];
        email.value = response['data']['email'];
      }
    } catch (e) {
      Utils.showSnackBar(title: 'Thông báo', message: '$e');
    }
  }
}
