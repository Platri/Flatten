import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';

class HandshakeListScreen extends StatefulWidget {
  @override
  _HandshakeListScreenState createState() => _HandshakeListScreenState();
}

class _HandshakeListScreenState extends State<HandshakeListScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultStickyHeaderController(
      child: CustomScrollView(
        slivers: [
          _StickyHeaderList("Favorites", getFavHandshakes()),
          _StickyHeaderList("Today", getTodayHandshakes()),
          _StickyHeaderList("Yesterday", getYesterdayHandshakes()),
        ],
      ),
    );
  }
}

List<Handshake> getFavHandshakes() {
  final now = DateTime.now();
  final yesterday = DateTime(now.year, now.month, now.day - 1, 12, 19);
  final threeDaysAgo = DateTime(now.year, now.month, now.day - 3, 16, 57);

  List<Handshake> hs = <Handshake>[
    Handshake(now, Color(0xFF88C7BC), "Sam"),
    Handshake(threeDaysAgo, Colors.yellow, "Jana"),
    Handshake(yesterday, Colors.yellow, "Jonas"),
    Handshake(yesterday, Color(0xFF88C7BC), "Sam"),
    Handshake(now, Colors.grey, "Supermarket"),
    Handshake(threeDaysAgo, Colors.grey, "Supermarket"),
  ];

  return hs;
}

List<Handshake> getTodayHandshakes() {
  final now = DateTime.now();
  final clock1 = DateTime(now.year, now.month, now.day, 17, 30);
  final clock2 = DateTime(now.year, now.month, now.day, 10, 0);
  final clock3 = DateTime(now.year, now.month, now.day, 7, 0);

  List<Handshake> hs = <Handshake>[
    Handshake(clock1, Color(0xFF88C7BC), "Sam"),
    Handshake(clock1, Colors.grey, "Supermarket"),
    Handshake(clock2, Colors.yellow, "Jana"),
    Handshake(clock2, Colors.yellow, "Jonas"),
    Handshake(clock3, Color(0xFF88C7BC), "Sam"),
  ];

  return hs;
}

List<Handshake> getYesterdayHandshakes() {
  final now = DateTime.now();
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final clock1 =
      DateTime(yesterday.year, yesterday.month, yesterday.day, 17, 30);
  final clock2 =
      DateTime(yesterday.year, yesterday.month, yesterday.day, 14, 0);
  final clock3 = DateTime(yesterday.year, yesterday.month, yesterday.day, 7, 0);

  List<Handshake> hs = <Handshake>[
    Handshake(clock1, Color(0xFF88C7BC), "Sam"),
    Handshake(clock1, Colors.yellow, "Jana"),
    Handshake(clock2, Colors.yellow, "Jonas"),
    Handshake(clock2, Color(0xFF88C7BC), "Sam"),
    Handshake(clock2, Colors.grey, "Supermarket"),
    Handshake(clock3, Colors.grey, "Supermarket"),
  ];

  return hs;
}

class _StickyHeaderList extends StatelessWidget {
  final List<Handshake> handshakes;
  final String title;

  _StickyHeaderList(this.title, this.handshakes);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff033076))),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(handshakes[i].getDateString()),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: handshakes[i].color),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(handshakes[i].name),
                  ),
                )
              ],
            ),
          ),
          childCount: handshakes.length,
        ),
      ),
    );
  }
}

class Handshake {
  DateTime date;
  Color color;
  String name;

  Handshake(this.date, this.color, this.name);

  String getDateString() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final aDate = DateTime(date.year, date.month, date.day);
    if (aDate == today) {
      var formatter = new DateFormat("HH:mm");
      return "Today - " + formatter.format(date);
    } else if (aDate == yesterday) {
      var formatter = new DateFormat("HH:mm");
      return "Yesterday - " + formatter.format(date);
    } else {
      var formatter = new DateFormat("dd.MM.yyy");
      return formatter.format(date);
    }
  }
}

enum STATUS { CLEAN, INFECTED, CONTACT, PLACE }
