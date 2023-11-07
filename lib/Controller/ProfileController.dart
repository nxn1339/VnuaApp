import 'package:agriculture/Navigation/Navigation.dart';
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
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await loadSavedText();
    fetchProfile(uuid);
  }

  loadSavedText() async {
    if (await Utils.getStringValueWithKey('id') != '' ||
        await Utils.getStringValueWithKey('id') != null) {
      uuid = await Utils.getStringValueWithKey('id');
    }

    if (uuid.isNotEmpty) {
      isLogin.value = true;
    } else {
      isLogin.value = false;
    }
  }

  void fetchProfile(String id) async {
    try {
      var response = await APICaller.getInstance().get('user/$id');
      if (response != null) {
        avatar.value = response['data']['avatar'];
        name.value = response['data']['name'];
        email.value = response['data']['email'];
      }
    } catch (e) {
      Utils.showSnackBar(title: 'Thông báo', message: '$e');
    }
  }

  void logOut() async {
    Utils.saveStringWithKey('id', '');
    Utils.saveStringWithKey('name', '');
    Utils.saveStringWithKey('avatar', '');
    Utils.saveStringWithKey('token', '');
    isLogin.value = false;
  }
}
