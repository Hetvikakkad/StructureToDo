import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnName;
  final Icon? icon;
  final Color? bgColor;
  final TextStyle? textStyle;
  final VoidCallback? callback;

  const RoundedButton({Key? key, required this.btnName, this.icon, this.bgColor, this.textStyle,  this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          callback!();
        }, child: icon != null ?Row(
          children: [
            icon!,
            Text(btnName,style: textStyle,),
          ],
     ): Text(btnName , style: textStyle,),
      style: ElevatedButton.styleFrom(
        primary: bgColor,
        shadowColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21),
            topRight: Radius.circular(21),
          )
      )
      ) ,
    );
  }
}
