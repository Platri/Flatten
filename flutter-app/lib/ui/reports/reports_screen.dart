import 'package:flatten/ui/reports/new_report_screen.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatefulWidget {
  @override
  _ReportsScreenState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  bool isOnCreate = false;

  @override
  Widget build(BuildContext context) {
    return !isOnCreate
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "If you have been tested positive on\nCovid-19\nyou need to photograph your test.\nIt will then be send to your Health care System and people with whom you had contact will be notified and can be tested.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Color(0xff033076)),
                ),
              ),
              RaisedButton(
                child: Text("Upload My Test"),
                onPressed: () {
                  setState(() {
                    isOnCreate = true;
                  });
                },
              )
            ],
          )
        : NewReportScreen();
  }
}
