import 'package:get/get.dart';

import '../utils/shared_pref.dart';

class TokenStorageService extends GetxService {
  String token = "todo_token";

  static TokenStorageService get to => Get.find();

  getToken() {
    print(SharedPrefs.to!.getString(this.token));
    return SharedPrefs.to!.getString(this.token);
  }
  setToken(_token) {
    return SharedPrefs.to!.setString(this.token, _token);
  }
  deleteToken() {
    return SharedPrefs.to!.remove(this.token);
  }
}
