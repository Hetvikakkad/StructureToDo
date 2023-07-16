import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';






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

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin{
  final formKey = GlobalKey<FormState>();
  AuthController authController = AuthController.to;
  TextEditingController nameContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  bool textErrorU = false;
  bool textErrorP = false;
  bool passVisible = false;
  late Animation animation;
  late AnimationController animationController;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passVisible = true;
    animationController = AnimationController(vsync: this,duration:Duration(seconds: 1) );
    animation = Tween(begin: 200.0,end: Get.width).animate(animationController);
    colorAnimation =  ColorTween(begin: Colors.blue,end: Colors.black12).animate(animationController);
    animation.addListener(() {
        setState(() {

        });
    });
    animationController.forward();
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text("sign In Api"),
      // ),
      body:  Container(
        padding: EdgeInsets.all(18),
        width: animation.value,
        color: colorAnimation.value,
        child: Form(
          // key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text("ToDo",style: TextStyle(fontSize: 30,color: Colors.indigo)),
              ),
              SizedBox(height: 30,),
              Text("Login to your Account",style: TextStyle(fontSize: 18,color: Colors.black)),
              SizedBox(height: 20,),
              TextField(
                controller: nameContoller,
                decoration: InputDecoration(
                  hintText: "User Name",
                  // errorText: textErrorU?"Enter currect user namer":null,
                  filled: false,
                  // suffixIcon: Icon(Icons.supervised_user_circle),
                  border: OutlineInputBorder(
                    borderSide: Divider.createBorderSide(context),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: Divider.createBorderSide(context),
                  ),

                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20,),
              TextField(
                controller: passwordContoller,
                decoration: InputDecoration(
                  hintText: "Password",
                  // errorText: textErrorP?"Enter correct passWord":null,
                  //old code filled true define
                  filled: false,
                    border: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    ),
                  // suffixIcon: IconButton(
                  //   icon: Icon(passVisible? Icons.visibility : Icons.visibility_off),
                  //   onPressed: (){
                  //     setState(() {
                  //       passVisible = !passVisible;
                  //     });
                  //   },
                  // ),
                ),
                obscureText: passVisible,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  this._triggerLogin();
                  Get.toNamed('/');
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Sign In",style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(40),
                child:  RichText(text: TextSpan(
                  children:  [
                    TextSpan(text: "don't have an  account? ",style: TextStyle(color: Colors.black,fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(text: "SignUp" ,  style: TextStyle(color: Colors.indigo, fontSize: 15),
                            recognizer:  TapGestureRecognizer()
                              ..onTap = () {
                                      Get.toNamed("/signup");
                              }
                        )
                      ]
                      ),

                  ]
              ))

                ),

            ],
          ),
        ),
      ),
    );

  }
}

