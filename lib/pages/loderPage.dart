import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../globals/loading.dart';

class LoaderPage extends StatefulWidget {
  const LoaderPage({Key? key}) : super(key: key);

  @override
  State<LoaderPage> createState() => _LoaderPageState();
}

class _LoaderPageState extends State<LoaderPage> {

  load() async {
    Future.delayed(Duration(seconds: 1), () async {
          Navigator.pop(context);
        });
      }

  void initState() {
    super.initState();
    load();
  }
  @override
  Widget build(BuildContext context)  => LoadingPage();

  }


