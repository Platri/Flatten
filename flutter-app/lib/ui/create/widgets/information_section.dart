import 'package:flutter/material.dart';

class AdditionalInformationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle style = const TextStyle(fontSize: 18, color: Color(0xff033076));

    InputDecoration informationTextAreaDecoration = const InputDecoration(
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(25.0),
        ),
      ),
      hintMaxLines: 2
    );

    return ListTile(
      title: Text("Additional Information", style: style),
      subtitle: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: size.width * 0.1
        ),        
        child: TextField(
          decoration: informationTextAreaDecoration,
        ),
      ),
    );
  }
}