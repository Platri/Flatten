import 'package:flatten/ui/reports/new_report_screen.dart';
import 'package:flutter/material.dart';

import '../../localizations.dart';

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
                    AppLocalizations.of(context).reportsTextLabel,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Color(0xff033076))
                ),
              ),
              RaisedButton(
                child: Text(AppLocalizations.of(context).reportsButtonLabel),
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
