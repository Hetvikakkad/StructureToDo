// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' show pi;
//
// enum CircleSide{
//   left,right
// }
// extension ToPath on CircleSide{
//   Path topath(Size size){
//
//     final path = Path();
//     late Offset offset;
//     late bool clockWise;
//
//     switch(this){
//       case CircleSide.left:
//         path.moveTo(size.width, 0);
//         offset = Offset(size.width,size.height);
//         clockWise =  false;
//       break;
//       case CircleSide.right:
//         offset = Offset(size.width, size.height);
//         clockWise = true;
//         break;
//     }
//     path.arcToPoint(
//       offset,
//       radius: Radius.elliptical(size.width / 2, size.height / 2),
//       clockwise: clockWise,
//     );
//     path.close();
//     return path;
//   }
//
// }
//
// class HalfCircle extends CustomClipper<Path>{
//   final CircleSide side;
//
//   HalfCircle(this.side);
//
//
//   @override
//   Path getClip(Size size) => side.topath(size);
//
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
//
// }
//
// class CustomAnimationsCircle extends StatefulWidget {
//   const CustomAnimationsCircle({Key? key}) : super(key: key);
//
//   @override
//   State<CustomAnimationsCircle> createState() => _CustomAnimationsCircleState();
// }
//
// extension on VoidCallback{
//   Future<void> delayed(Duration duration) => Future.delayed(duration,this);
// }
//
// class _CustomAnimationsCircleState extends State<CustomAnimationsCircle> with TickerProviderStateMixin {
//   late AnimationController _animationControllerClockWise;
//   late Animation _animationRotation;
//   late AnimationController flipAnimationController;
//   late Animation flipAnimation;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _animationControllerClockWise = AnimationController(vsync: this, duration: Duration(seconds: 1));
//     _animationRotation = Tween(begin: 0,end:-(pi/2) ,).animate(CurvedAnimation(parent: _animationControllerClockWise, curve: Curves.bounceIn));
//     flipAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
//     flipAnimation = Tween(begin: 0, end: pi,).animate(CurvedAnimation(parent: flipAnimationController, curve: Curves.bounceIn));
//     //add
//     _animationControllerClockWise.addStatusListener((status) {
//       if(status ==  AnimationStatus.completed){
//         flipAnimation = Tween(begin: flipAnimation.value, end: flipAnimation.value + pi,)
//             .animate(CurvedAnimation(parent: flipAnimationController, curve: Curves.bounceIn));
//         flipAnimationController
//         ..reset()
//         ..forward();
//       }
//     });
//   }
//   @override
//   void dispose() {
//     _animationControllerClockWise;
//     flipAnimationController;
//     // TODO: implement dispose
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//       _animationControllerClockWise
//         ..reset()
//         ..forward.delayed(Duration(
//           seconds: 1
//         ));
//
//     return Scaffold(
//       body: SafeArea(
//         child: AnimatedBuilder(
//           animation: _animationControllerClockWise,
//          builder: (context,child){
//            return Transform(
//              alignment: Alignment.center,
//              transform: Matrix4.identity()..rotateZ(_animationControllerClockWise.value),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  ClipPath(
//                    clipper:  HalfCircle(CircleSide.left),
//                    child: Container(
//                      color: Colors.blue,
//                      width: 100,
//                      height: 100,
//                    ),
//                  ),
//                  ClipPath(
//                    clipper:  HalfCircle(CircleSide.right),
//                    child: Container(
//                      color: Colors.yellow,
//                      width: 100,
//                      height: 100,
//                    ),
//                  )
//                ],
//              ),
//            );
//          },
//
//         ),
//       ),
//     );
//   }
// }
