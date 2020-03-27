import 'package:flatten/ui/create/create_qr_screen.dart';
import 'package:flatten/ui/encounters/encrounter_list_screen.dart';
import 'package:flatten/ui/handshake/handshake_screen.dart';
import 'package:flatten/ui/logbook/health_logbook_screen.dart';
import 'package:flatten/ui/reports/reports_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) {
        return AppLocalizations.of(context).title;
      },
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("en"),
        const Locale("de"),
      ],
      theme: ThemeData(
          primaryColorDark: Color(0xff033076),
          accentColor: Color(0xFF88C7BC),
          primaryColor: Colors.white,
          splashColor: Color(0xFF88C7BC),
          primaryTextTheme: TextTheme(
              headline6: TextStyle(
                  color: Color(0xff033076), fontWeight: FontWeight.bold)),
          buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            buttonColor: Color(0xff033076),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0)),
          )),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HealthLogbookScreen(),
    HandshakeScreen(),
    HandshakeListScreen(),
    CreateQRScreen(),
    ReportsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var activeMenuPage = "";
    switch (_selectedIndex) {
      case 0:
        activeMenuPage = AppLocalizations.of(context).healthLogbookTitleLabel;
        break;
      case 1:
        activeMenuPage =
            AppLocalizations.of(context).virtualHandshakeTitleLabel;
        break;
      case 2:
        activeMenuPage = AppLocalizations.of(context).handshakeListTitleLabel;
        break;
      case 3:
        activeMenuPage = AppLocalizations.of(context).createQrCodeTitleLabel;
        break;
      case 4:
        activeMenuPage = AppLocalizations.of(context).reportsTitleLabel;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeMenuPage),
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF88C7BC),
        unselectedItemColor: Color(0xff033076),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Container(), icon: Icon(Icons.favorite_border)),
          BottomNavigationBarItem(
              title: Container(), icon: Icon(LineAwesomeIcons.qrcode)),
          BottomNavigationBarItem(
              title: Container(), icon: Icon(LineAwesomeIcons.list)),
          BottomNavigationBarItem(
              title: Container(), icon: Icon(LineAwesomeIcons.map_pin)),
          BottomNavigationBarItem(
              title: Container(),
              icon: Icon(LineAwesomeIcons.exclamation_triangle)),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
