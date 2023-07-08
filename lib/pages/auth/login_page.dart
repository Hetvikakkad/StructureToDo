import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';


import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:structured_todo/controllers/auth/auth_controller.dart';
import 'package:structured_todo/pages/HomePage.dart';
import 'package:structured_todo/pages/auth/signup_page.dart';
import 'package:structured_todo/utils/shared_pref.dart';

class SignInPage extends StatefulWidget {


  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState(
  );
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  AuthController authController = AuthController.to;
  TextEditingController nameContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  bool textErrorU = false;
  bool textErrorP = false;
  bool passVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passVisible = true;
  }

  _triggerLogin() {
      try {
        this.authController.login(
            user: nameContoller.text,
            password: passwordContoller.text
        );
      } catch (e) {
        print(e);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sign In Api"),
      ),
      body:  Container(
        padding: EdgeInsets.all(8),
        child: Form(
          // key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TextField(
                controller: nameContoller,
                decoration: InputDecoration(
                  hintText: "Enter User name",
                  // errorText: textErrorU?"Enter currect user namer":null,
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
                  // errorText: textErrorP?"Enter correct passWord":null,
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
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  this._triggerLogin();
                  Get.toNamed('/home');
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text("Sign In"),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(25),
                child:  RichText(text: TextSpan(
                  children:  [
                    TextSpan(text: "don't have an  account ? ",style: TextStyle(color: Colors.black,fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: "SignUp" ,  style: TextStyle(color: Colors.blue, fontSize: 15),
                            recognizer:  TapGestureRecognizer()
                              ..onTap = () {
                                      Get.toNamed("/signup");
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

