import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class CreateQRScreen extends StatefulWidget {
  @override
  _CreateQRScreenState createState() => _CreateQRScreenState();
}

class _CreateQRScreenState extends State<CreateQRScreen> {
  SingingCharacter _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
              "You can generate QR-Codes to e.g. print and put at doors/buildings. Everyone that enters and leaves the location scans the code so FLATTEN know to whom you had contact to.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Color(0xff033076))),
          SizedBox(
            width: double.infinity,
            child: Text("Name:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff033076))),
          ),
          TextField(
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                hintMaxLines: 2,
                hintText:
                    "e.g. Supermarket Plaldi Nord\ne.g. workplace room 1, room 2"),
          ),
          SizedBox(
            width: double.infinity,
            child: Text("Use for:",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, color: Color(0xff033076))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Radio(
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              Text("company",
                  style: TextStyle(fontSize: 18, color: Color(0xff033076))),
              Radio(
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              Text("private",
                  style: TextStyle(fontSize: 18, color: Color(0xff033076))),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Text("Pick GPS-Position:",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, color: Color(0xff033076))),
          ),
          Center(
            child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: Colors.black)),
                child: Icon(LineAwesomeIcons.map_pin)),
          ),
          SizedBox(
            width: double.infinity,
            child: Text("Additional Information",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, color: Color(0xff033076))),
          ),
          TextField(
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  hintMaxLines: 2)),
          RaisedButton(
            child: Text("Generate"),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }
