import 'package:flutter/material.dart';

Widget hsInfoText({@required String text, @required double width}) {
  return SizedBox(
    width: width,
    child: Text(
      text,
      style: TextStyle(
        color: Color(0xff88c7bc),
        fontSize: 17,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget hsInfoIcon({@required String path, @required double width}) {
  return SizedBox(
    height: width,
    width: width,
    child: Image.asset(path)
  );
}
