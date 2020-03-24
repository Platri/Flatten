import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewReportScreen extends StatefulWidget {
  @override
  _NewReportScreen createState() => _NewReportScreen();
}

class _NewReportScreen extends State<NewReportScreen> {
  int _sliderValue = 2;
  GenderCharacter _character = GenderCharacter.female;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
                "Thanks for uploading your Test! We just notified your Health care System. To get additional information about the Virus, which we need to acelerate the Research, it would be awsome if you could take 5 minutes to answer the Questions below. You don't have to do this. This is voluntary.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Color(0xff033076))),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("How ill do you feel?",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff033076))),
              ),
            ),
            SizedBox(height: 50),
            Slider(
              value: _sliderValue.toDouble(),
              min: 0,
              max: 5,
              divisions: 5,
              activeColor: Colors.orange,
              inactiveColor: Colors.black,
              label: getFeelingText(_sliderValue),
              onChanged: (double newValue) {
                setState(() {
                  _sliderValue = newValue.round();
                });
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      6,
                      (index) => Text(getFeelingText(index),
                          style: TextStyle(
                              fontSize: 12, color: Color(0xff033076)))),
                )),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Sex:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff033076))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Radio(
                  value: GenderCharacter.female,
                  groupValue: _character,
                  onChanged: (GenderCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                Text("female",
                    style: TextStyle(fontSize: 18, color: Color(0xff033076))),
                Radio(
                  value: GenderCharacter.diverse,
                  groupValue: _character,
                  onChanged: (GenderCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                Text("diverse",
                    style: TextStyle(fontSize: 18, color: Color(0xff033076))),
                Radio(
                  value: GenderCharacter.male,
                  groupValue: _character,
                  onChanged: (GenderCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
                Text("male",
                    style: TextStyle(fontSize: 18, color: Color(0xff033076))),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Age:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff033076))),
              ),
              Container(
                width: 100,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      hintMaxLines: 2,
                    )),
              ),
            ]),
            SizedBox(height: 20),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Weight in kg:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff033076))),
              ),
              Container(
                width: 140,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      hintMaxLines: 2,
                    )),
              ),
            ]),
            SizedBox(height: 20),
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Height in cm:",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff033076))),
              ),
              Container(
                width: 100,
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      hintMaxLines: 2,
                    )),
              ),
            ]),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Text("Chronical Diseases:",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18, color: Color(0xff033076))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  minLines: 5,
                  maxLines: 10,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        ),
                      ),
                      hintMaxLines: 2)),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Text("Additional Informations:",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18, color: Color(0xff033076))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                minLines: 5,
                maxLines: 10,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                )),
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text("Submit"),
              onPressed: () {},
            )
          ],
        ));
  }

  String getFeelingText(int value) {
    switch (value) {
      case 0:
        return "super";
      case 1:
        return "good";
      case 2:
        return "ok";
      case 3:
        return "bad";
      case 4:
        return "really bad";
      case 5:
        return "terrible";
      default:
        return "no value";
    }
  }
}

enum GenderCharacter { female, diverse, male }
