
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String buttonText;
  final dynamic onPressed;

  const CustomButton({Key? key,required this.buttonText,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          primary: Colors.indigo,
        ),
        onPressed: onPressed,
        child: Text(buttonText,textAlign: TextAlign.center,),
      ),
    );
  }
}
