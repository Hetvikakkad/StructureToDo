import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:structured_todo/globals/buttons.dart';
import 'package:structured_todo/globals/utilities.dart';


import '../controllers/auth/auth_controller.dart';

class TodoDrawer extends StatefulWidget {
  const TodoDrawer({Key? key}) : super(key: key);

  @override
  State<TodoDrawer> createState() => _TodoDrawerState();
}

class _TodoDrawerState extends State<TodoDrawer> {

  AuthController authController = AuthController.to;

  _triggerLogout(){
    try {
      this.authController.logout();
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // key: globalKey,
      child: Drawer(
            child: Container(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                          buildSeparator(20),
                          buildLogout(),
                  ],
                ),
              ),
            ),
      )
    );
  }
buildLogout() =>  GestureDetector(
  onTap: () {
   this._triggerLogout();
  },
  child: Container(
    height: 50,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Center(
      child: Text("logout"),
    ),
  ),
);
}
