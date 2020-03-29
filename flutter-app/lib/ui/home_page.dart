import 'package:flatten/bloc/auth_bloc.dart';
import 'package:flatten/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flatten/ui/create/create_qr_screen.dart';
import 'encounters/encounter_list_screen.dart';
import 'package:flatten/ui/logbook/health_logbook_screen.dart';
import 'package:flatten/ui/reports/reports_screen.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:flatten/localizations.dart';
import 'package:flatten/ui/handshake/handshake_decider.dart';


class HomePage extends StatefulWidget {
  HomePage({@required this.user});
  User user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  List<Widget> _widgetOptions = <Widget>[
    HealthLogbookScreen(),
    HandShakeDecider(),
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

    return BlocProvider<User>(
      bloc: widget.user,
          child: Scaffold(
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
      ),
    );
  }
}
