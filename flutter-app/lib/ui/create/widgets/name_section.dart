import 'package:flutter/material.dart';

class NameSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle nameStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color(0xff033076)
    );

    InputDecoration nameTextAreaDecoration = InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(25.0),
          ),
        ),
        hintMaxLines: 2,
        hintText:
            "e.g. Supermarket Plaldi Nord\ne.g. workplace room 1, room 2"
    );

    Size size = MediaQuery.of(context).size;

    return ListTile(
      title: Text("Name:", style: nameStyle),
      subtitle: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: size.width * 0.1
        ),
        child: TextField(decoration: nameTextAreaDecoration,),
      ),
    );
  }
}