import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class GpsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Pick GPS-Position:",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 18,
          color: Color(0xff033076)
        )
      ),
      subtitle:  Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 2, color: Colors.black)
          ),
          child: Icon(LineAwesomeIcons.map_pin)),
      ),
    );
  }
}