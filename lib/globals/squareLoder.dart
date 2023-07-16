import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RotedSquare extends StatefulWidget {
  const RotedSquare({Key? key}) : super(key: key);

  @override
  State<RotedSquare> createState() => _RotedSquareState();
}

class _RotedSquareState extends State<RotedSquare> with SingleTickerProviderStateMixin {
  late final  AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 5),)..repeat();
    super.initState();
    _animationController.forward();
  }
  @override
  void dispose() {
    // 4. dispose the AnimationController when no longer needed
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: AnimatedBuilder(
          // 2. pass our AnimationController as the animation argument
          animation: _animationController,
          // 3. pass the child widget that we will animate
          child: AnimatedContainer(width: 50, height: 50, color: Colors.red, duration: Duration(seconds: 5),),
          // 4. add a builder argument (this will be called when the animation value changes)
          builder: (context, child) {
            // 5. use a Transform widget to apply a rotation
            return Transform.rotate(
              // 6. the angle is a function of the AnimationController's value
              angle: 0.5 * pi * _animationController.value,
            );
          },

      ),
    );
  }
}
