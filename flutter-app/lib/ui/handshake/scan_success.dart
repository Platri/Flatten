import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:location/location.dart';

import 'widgets/section_title.dart';
import 'widgets/sub_section.dart';
import 'widgets/success_image.dart';
import 'widgets/success_message.dart';

class ScanSuccessScreen extends StatefulWidget {
  @override
  _ScanSuccessScreenState createState() => _ScanSuccessScreenState();
}

class _ScanSuccessScreenState extends State<ScanSuccessScreen> {
  LocationData _locationData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SuccessImage(),
          SuccessMessage(),
          SectionTitle(title: "Captured:",),
          SubSection(
            title: "ID:",
            data: Text("1334-2889-1211-9039")
          ),
          SubSection(
            title: "Date:",
            data: Text("20.03.2020")
          ),
          SubSection(
            title: "Time:",
            data: Text("12:38")
          ),
          SectionTitle(title: "Additional Information:",),
          SubSection(
            title: "Location:",
            data:  InkWell(
              customBorder: CircleBorder(),
              onTap: () => test(),
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _locationData != null
                      ? Colors.green
                      : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: Colors.black)),
                  child: Icon(LineAwesomeIcons.map_pin)),
              ),
            )
          ),
          SubSection(title: "Notes", data: Container(),),
          Padding(
            padding:
              const EdgeInsets.only(top: 8, left: 32, right: 32, bottom: 8),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                hintMaxLines: 2
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Submit"),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Future<void> test() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {});

    print(_locationData);
  }
}