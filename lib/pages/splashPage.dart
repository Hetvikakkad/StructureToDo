import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:structured_todo/pages/welcome.dart';

import '../controllers/auth/auth_controller.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final authController = AuthController.to;
  load() async {
    Future.delayed(Duration(seconds: 1), () async {
      // print("====spla==================================== ${AuthController.to.isLoggedIn}");
      if(AuthController.to.isLoggedIn ) {
        Future.delayed(Duration(seconds: 2), () async {
          await Get.offAllNamed('/home');
        });
      } else {
        Get.offAllNamed('/login');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }
  @override
  Widget build(BuildContext context) =>  Welcome();
}
