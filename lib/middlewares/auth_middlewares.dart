import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:structured_todo/controllers/auth/auth_controller.dart';

import '../provides/auth/auth_provider.dart';

class AuthenticationRequiredMiddleware extends GetMiddleware {

  AuthController authController = AuthController.to;

  @override
  RouteSettings? redirect(route) {
    if ((this.authController.isLoggedIn == true)) {
      return null;
    } else {
      return RouteSettings(name: '/login');
    }
  }
}