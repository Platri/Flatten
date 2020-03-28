import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:location/location.dart';

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
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF88C7BC)),
                child: Icon(
                  LineAwesomeIcons.check,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text("Successful Scan!",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff033076))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Text("Captured:",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("ID:",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff033076))),
                Text("1334-2889-1211-9039")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Date:",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff033076))),
                Text("        20.03.2020")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Time:",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff033076))),
                Text("12:38")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Text("Additional Information:",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Location:",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff033076))),
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {
                    test();
                  },
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
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: SizedBox(
              width: double.infinity,
              child: Text("Notes:",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff033076))),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 32, right: 32, bottom: 8),
            child: TextField(
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    hintMaxLines: 2)),
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
