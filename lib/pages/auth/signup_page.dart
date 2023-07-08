import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';

import '../../controllers/auth/auth_controller.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState(
  );
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  AuthController authController = AuthController.to;

  TextEditingController nameContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  bool textErrorU = false;
  bool textErrorP = false;
  bool passVisible = false;

  _triggerSignUp() {
    try {
      this.authController.signup(
          user: nameContoller.text,
          password: passwordContoller.text
      );
    } catch (e) {
      print(e);
    }
  }

@override
  void initState() {
  nameContoller.text = '';
  passwordContoller.text = '';
    // TODO: implement initState
    super.initState();
    passVisible = true;
    nameContoller.clear();
    passwordContoller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sign up Api"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextField(
                controller: nameContoller,
                decoration: InputDecoration(
                    hintText: "Enter User name",
                    errorText: textErrorU?"Enter currect user namer":"",
                    filled: false,
                    suffixIcon: Icon(Icons.supervised_user_circle),
                    border: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    )
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20,),
              TextField(
                controller: passwordContoller,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  errorText: textErrorP?"Enter correct passWord":"",
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: Divider.createBorderSide(context),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: Divider.createBorderSide(context),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(passVisible? Icons.visibility : Icons.visibility_off),
                    onPressed: (){
                      setState(() {
                        passVisible = !passVisible;
                      });
                    },
                  ),
                ),
                obscureText: passVisible,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
              ),
              GestureDetector(
                onTap: () {
                 this._triggerSignUp();
                 Get.toNamed('/');
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text("Sign up"),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(25),
                  child:  RichText(text: TextSpan(
                      children:  [
                        TextSpan(text: "already user ? ",style: TextStyle(color: Colors.black,fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(text: "SignIn" ,  style: TextStyle(color: Colors.blue, fontSize: 15),
                                  recognizer:  TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed("/login");

                                    }
                              )
                            ]
                        ),

                      ]
                  ))),
            ],
          ),
        ),
      ),
    );

  }
}
