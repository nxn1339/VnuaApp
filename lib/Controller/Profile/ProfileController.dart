import 'package:agriculture/Service/APICaller.dart';
import 'package:agriculture/Utils/Utils.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool isLogin = false.obs;
  String uuid = '';
  RxString avatar = ''.obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxInt permission = 3.obs;
  RxString permissionName = 'Học Sinh'.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await loadSavedText();
    if (uuid != '') {
      fetchProfile(uuid);
      print(uuid);
    }
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
        permission.value = response['data']['permission'];
        switch (permission.value) {
          case 1:
            permissionName.value = 'Admin';
            break;
          case 2:
            permissionName.value = 'Sinh viên tình nguyện';
            break;
          default:
            permissionName.value = 'Học sinh';
            break;
        }
        isLogin.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  void refreshData() {
    fetchProfile(uuid);
  }

  void logOut() async {
    Utils.saveStringWithKey('id', '');
    Utils.saveStringWithKey('name', '');
    Utils.saveStringWithKey('avatar', '');
    Utils.saveStringWithKey('token', '');
    isLogin.value = false;
  }
}
