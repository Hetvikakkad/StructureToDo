import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';

import '../../services/api_services.dart';
import '../../services/token_storage_services.dart';

class AuthProvider{

  static getToken() {
    return TokenStorageService.to.getToken();
  }

  static setToken(token) {
    return TokenStorageService.to.setToken(token);
  }

  static isLoggedIn(token) {
    return getToken() != null;
  }
  static login({user = "", password = ""}) async {
    return await APIService.post(
        "/user/login",
        {
          "user": user,
          "password": password,
        },
        authenticationRequired: false
    );
  }
  static signup({user = "", password = ""}) async {
    return await APIService.post(
        "/user/signup",
        {
          "user": user,
          "password": password,
        },
        authenticationRequired: false
    );
  }

  static logout() async{
    return await TokenStorageService.to.deleteToken();
  }

}