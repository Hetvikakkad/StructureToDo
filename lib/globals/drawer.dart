import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:structured_todo/globals/buttons.dart';
import 'package:structured_todo/globals/utilities.dart';


import '../controllers/auth/auth_controller.dart';

class TodoDrawer extends StatefulWidget {
  const TodoDrawer({Key? key}) : super(key: key);

  @override
  State<TodoDrawer> createState() => _TodoDrawerState();
}

class _TodoDrawerState extends State<TodoDrawer> with SingleTickerProviderStateMixin{

  AuthController authController = AuthController.to;
  late AnimationController animationController;
  late Animation ZoomAnimation;
  late Animation colorAnimation;

  _triggerLogout(){
    try {
      this.authController.logout();
    }
    catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this,duration:Duration(seconds: 2) );
    ZoomAnimation = Tween(begin: 0.0,end: Get.width).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.lightBlueAccent,end:Colors.transparent ).animate(animationController);
    ZoomAnimation.addListener(() {
      setState(() {

      });
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // key: globalKey,
      child: Drawer(
        shadowColor: Colors.indigo,
            child: ListView(
              children:<Widget> [
                DrawerHeader(
                  child:Text("ToDo",style:TextStyle( fontSize: 10,color: Colors.white,)),
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      image: DecorationImage(
                          fit:BoxFit.fill,
                          scale: ZoomAnimation.value,
                          image: AssetImage("assets/images/todo.jpg"))
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("logout"),
                  onTap: _triggerLogout,
                )

              ],
            )
      )
    );
  }
// buildLogout() =>  GestureDetector(
//   onTap: () {
//    this._triggerLogout();
//   },
//   child: Container(
//     height: 50,
//     width: 100,
//     decoration: BoxDecoration(
//       color: Colors.blue,
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: Center(
//       child: Text("logout"),
//     ),
//   ),
// );
}
