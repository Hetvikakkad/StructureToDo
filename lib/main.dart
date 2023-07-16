import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:structured_todo/config/routes/routes_config.dart';
import 'package:structured_todo/controllers/home/homepage_controller.dart';
import 'package:structured_todo/controllers/home/notes_controller.dart';
import 'package:structured_todo/services/api_services.dart';
import 'package:structured_todo/services/endpoint_services.dart';
import 'package:structured_todo/services/token_storage_services.dart';
import 'package:structured_todo/utils/get_storage.dart';
import 'package:structured_todo/utils/shared_pref.dart';

import 'controllers/auth/auth_controller.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Register utiliti
  await SharedPrefs().init();
  await GetStorageUtil().init();

  // SharedPrefs.to?.getString("token") == true ? HomePage() : SignInPage();

  //Regis services
  Get.put(APIService(),permanent: true);
  Get.put(EndpointService(),permanent: true);
  Get.put(TokenStorageService(),permanent: true);


  //Regis controllers
  Get.lazyPut(() => AuthController(), fenix: true);
  Get.lazyPut(() => NotesController(), fenix: true);
  Get.lazyPut(() => HomepageController(), fenix: true);



  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TODO APP",
      getPages: TOdoRoutesConfig.getRoutes(),
      // home: SplashPage(),
    );
  }
}


