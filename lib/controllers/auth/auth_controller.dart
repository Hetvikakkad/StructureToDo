

import 'package:get/get.dart';

import '../../provides/auth/auth_provider.dart';
import '../../services/token_storage_services.dart';


class AuthController extends GetxController {
  final _token = ''.obs;
  final error = false.obs;
  final message = "".obs;
  final RxBool loading = false.obs;
  final RxBool rememberMe = false.obs;

  static AuthController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    this._token(AuthProvider.getToken());

  }

  get token {
    return this._token;
  }

  get isLoggedIn {
    return this._token.value != '';
  }


  void login({user = "", password = ""}) async {
    try {
      this.loading(true);
      final _response = await AuthProvider.login(
        user: user,
        password: password,
      );
     // / print(_response);
     //  print(_response.data.code);
      if (_response != null) {
        if (_response.code == 200) {
          print("==============================");
          print(_response.data);
          TokenStorageService.to.setToken(_response.data["token"]);
          print(TokenStorageService.to.setToken("${_response.data["token"]}"));
          this._token(_response.data['token']);
          Get.offAllNamed("/home");
          // await Future.delayed(Duration(milliseconds: 1000), () {
          //   this.loading(false);
          // });
        }
        else {
          await Future.delayed(Duration(milliseconds: 1000), () {
            this.loading(false);
          });
        }
      }
      else {
        await Future.delayed(Duration(milliseconds: 1000), () {
          this.loading(false);
        });
      }
    }
    catch (e) {
      print(e);
      this.loading(false);
      this.error(true);
      this.message("There was an error. Please try again.");
    } finally {
      this.loading(false);
    }
  }

  void signup({user = "", password = ""}) async {
    try {
      this.loading(true);
      final _response = await AuthProvider.signup(
        user: user,
        password: password,
      );
      print(_response);
      if (_response != null) {
        if (_response.code == 200) {
          // if(!GetStorageUtil.to.read("products").isBlank){
          //   CartProvider.getLoginCart(GetStorageUtil.to.read("products"));
          // }
          Get.offAllNamed("/login");
          await Future.delayed(Duration(milliseconds: 1000), () {
            this.loading(false);
          });
        }
        else {
          await Future.delayed(Duration(milliseconds: 1000), () {
            this.loading(false);
          });
        }
      }
      else {
        await Future.delayed(Duration(milliseconds: 1000), () {
          this.loading(false);
        });
      }
    }
    catch (e) {
      print(e);
      this.loading(false);
      this.error(true);
      this.message("There was an error. Please try again.");
    } finally {
      this.loading(false);
    }
  }

  void logout() async {
    try {
      final response = await AuthProvider.logout();
      this._token("");
    }
    catch (e) {
      print(e);
      this.error(true);
      this.message("There was an error. Please try again.");
    }
    Get.offAllNamed("/login",arguments: "Logging out...");
  }
}