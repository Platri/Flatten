import 'package:flutter/material.dart';

Widget informationText(String text, double width) {
  return SizedBox(
    width: width,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
