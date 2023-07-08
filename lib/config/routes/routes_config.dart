import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:structured_todo/pages/HomePage.dart';
import 'package:structured_todo/pages/auth/login_page.dart';
import 'package:structured_todo/pages/auth/signup_page.dart';
import 'package:structured_todo/pages/splashPage.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../middlewares/auth_middlewares.dart';


class TOdoRoutesConfig{
  static var routes = <dynamic>[

    {
      "name": "/",
      "route_name": "Splash Page",
      "widget": SplashPage(),
      "auth_required": false
    },
    {
      "name": "/signup",
      "route_name": "Signup Page",
      "widget": SignUpPage(),
      "auth_required": false
    },
    {
      "name": "/login",
      "route_name": "Signin Page",
      "widget": SignInPage(),
      "auth_required": false
    },
    {
      "name": "/home",
      "route_name": "Home Page",
      "widget": HomePage(),
      "auth_required": true
    }
  ];

  static dynamic getRoutes() {
    List<GetPage> _generatedRoutes = [];

    for (var route in routes) {
      if (AuthController.to.isLoggedIn) {
        _generatedRoutes.add(GetPage(
          name: route["name"],
          page: () => route["widget"],
          middlewares: (route["auth_required"] == true)
              ? [AuthenticationRequiredMiddleware()]
              : [],
        ));
      } else {
        _generatedRoutes.add(GetPage(
          name: route["name"],
          page: () => route["widget"],
        ));
      }
    }
    return _generatedRoutes;
  }
}