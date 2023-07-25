import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../controllers/auth/auth_controller.dart';
import 'login_page.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState(
  );
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin{
  final formKey = GlobalKey<FormState>();
  AuthController authController = AuthController.to;

  TextEditingController nameContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool textErrorU = false;
  bool textErrorP = false;
  bool passVisible = false;
  late Animation animation;
  late AnimationController animationController;
  late Animation colorAnimation;

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
      animationController = AnimationController(vsync: this,duration:Duration(seconds: 1) );
      animation = Tween(begin: 200.0,end: Get.width).animate(animationController);
      colorAnimation =  ColorTween(begin: Colors.blue,end: Colors.white).animate(animationController);
      animation.addListener(() {
        setState(() {

        });
      });
      animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: animation.value,
          padding: EdgeInsets.all(20),
          color: colorAnimation.value,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    GestureDetector(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                       },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: 70,
                        child: Image.asset('assets/images/back.jpg',scale: 2.8,),
                      ),
                    )
                    // Image.asset('assets/images/back.jpg',scale: 2.8,)
                  ],
                ),
                SizedBox(height: 30,),
                Center(
                  child: Text("ToDo",style: TextStyle(fontSize: 30,color: Colors.indigo)),
                  //   child: Image.asset("assets/images/todo.jpg",),
                ),
                SizedBox(height: 30,),
                Text("Create your Account",style: TextStyle(fontSize: 18,color: Colors.black),textAlign: TextAlign.left,),
                SizedBox(height: 20,),
                TextField(
                  controller: nameContoller,
                  decoration: InputDecoration(
                      hintText: "User Name",
                      // errorText: textErrorU?"Enter currect user namer":"",
                      filled: false,
                      // suffixIcon: Icon(Icons.supervised_user_circle),
                    border: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    )
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: passwordContoller,
                  decoration: InputDecoration(
                    hintText: "Password",
                    // errorText: textErrorP?"Enter correct passWord":"",
                    filled: false,
                    border: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context),
                      )
                    // suffixIcon: IconButton(
                    //   icon: Icon(passVisible? Icons.visibility : Icons.visibility_off),
                    //   onPressed: (){
                    //     setState(() {
                    //       passVisible = !passVisible;
                    //     });
                    //   },
                    // ),
                  ),
                  // obscureText: passVisible,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    // errorText: textErrorP?"Enter correct passWord":"",
                    filled: false,
                    border: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(context),
                    ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: Divider.createBorderSide(context),
                      )
                    // suffixIcon: IconButton(
                    //   icon: Icon(passVisible? Icons.visibility : Icons.visibility_off),
                    //   onPressed: (){
                    //     setState(() {
                    //       passVisible = !passVisible;
                    //     });
                    //   },
                    // ),
                  ),
                  // obscureText: passVisible,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    if(passwordContoller.text != confirmPasswordController.text){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("password not same")));
                    }
                    else{
                      this._triggerSignUp();
                      Get.toNamed('/login');
                    }
                  },
                  child: Container(
                    height: 50,
                    // width: 100,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text("Sign up",style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.all(25),
                    // child:  RichText(text: TextSpan(
                    //     children:  [
                    //       TextSpan(text: "already user ? ",style: TextStyle(color: Colors.black,fontSize: 18),
                    //           children: <TextSpan>[
                    //             TextSpan(text: "SignIn" ,  style: TextStyle(color: Colors.indigo, fontSize: 15),
                    //                 recognizer:  TapGestureRecognizer()
                    //                   ..onTap = () {
                    //                     Get.toNamed("/login");
                    //
                    //                   }
                    //             )
                    //           ]
                    //       ),
                    //
                    //     ]
                    // ))
                  ),
              ],
            ),
          ),
        ),
      ),

    );


  }
}
