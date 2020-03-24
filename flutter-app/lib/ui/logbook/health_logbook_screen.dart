import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class HealthLogbookScreen extends StatefulWidget {
  @override
  _HealthLogbookScreenState createState() => _HealthLogbookScreenState();
}

class _HealthLogbookScreenState extends State<HealthLogbookScreen> {
  List<TimelineModel> items = [
    HealthLogbookTimelineModel(getDateString(DateTime.now()), STATUS.GOOD),
    HealthLogbookTimelineModel(
        getDateString(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 1)),
        STATUS.NEUTRAL,
        cough: "medium",
        temp: 36.34,
        headaches: "none"),
    HealthLogbookTimelineModel(
        getDateString(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 2)),
        STATUS.NEUTRAL,
        cough: "medium",
        temp: 37.89,
        headaches: "a bit"),
    HealthLogbookTimelineModel(
        getDateString(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 3)),
        STATUS.BAD,
        cough: "alot",
        temp: 38.32,
        headaches: "bad"),
    HealthLogbookTimelineModel(
        getDateString(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 4)),
        STATUS.BAD,
        cough: "bit",
        temp: 37.00,
        headaches: "bad"),
  ];

  static String getDateString(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final aDate = DateTime(date.year, date.month, date.day);
    if (aDate == today) {
      return "Today";
    } else if (aDate == yesterday) {
      return "Yesterday";
    } else {
      var formatter = new DateFormat("dd.MM.yyy");
      return formatter.format(aDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Timeline(children: items, position: TimelinePosition.Left);
  }
}

class HealthLogbookTimelineModel extends TimelineModel {
  HealthLogbookTimelineModel(String date, STATUS status,
      {String cough, double temp, String headaches})
      : super(
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      date,
                      style: TextStyle(fontSize: 20, color: Color(0xff033076)),
                    ),
                    Row(
                      mainAxisAlignment: status == STATUS.GOOD
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xFF88C7BC)),
                          child: Icon(
                            status == STATUS.BAD
                                ? LineAwesomeIcons.frown_o
                                : LineAwesomeIcons.meh_o,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        status != STATUS.GOOD
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text("Cough: $cough"),
                                    Text("Body Temperature: $temp°"),
                                    Text("Headaches: $headaches"),
                                  ],
                                ),
                              )
                            : SizedBox.shrink()
                      ],
                    ),
                  ],
                ),
              ),
            ),
            iconBackground:
                status == STATUS.GOOD ? Colors.green : Colors.orangeAccent);
}

class HealthyLogbookTimelineModel extends TimelineModel {
  HealthyLogbookTimelineModel(String date)
      : super(
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      date,
                      style: TextStyle(fontSize: 20, color: Color(0xff033076)),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF88C7BC)),
                      child: Icon(
                        LineAwesomeIcons.smile_o,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            iconBackground: Colors.green);
}

enum STATUS { GOOD, NEUTRAL, BAD }
