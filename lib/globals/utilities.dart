import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildSeparator(double height) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8.0),
  child: Divider(
    color: Colors.transparent,
    height: height,
  ),
);
