import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  const CustomTextFiled({Key? key,required this.label,required this.hintText , required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: Divider.createBorderSide(context),
          ),
          hintText: hintText,
          labelText: label,

        ),
      ),
    );
  }
}
