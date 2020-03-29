import 'package:flatten/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flatten/ui/handshake/widgets/camera_view.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'widgets/qr_view.dart';
import 'package:flatten/bloc/bloc_provider.dart';
import 'package:flatten/bloc/auth_bloc.dart';
import 'handshake_info_screen.dart';


class HandshakeScreen extends StatelessWidget {
  final Icon qrIcon = Icon(
    LineAwesomeIcons.qrcode,
    color: Color(0xFF08A388),
  );

  final Icon cameraIcon = Icon(
    LineAwesomeIcons.camera,
    color: Color(0xFF08A388),
  );

  @override
  Widget build(BuildContext context) {
    final user = BlocProvider.of<User_Bloc>(context); //this gives the current logged in user
    return SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height/1.2,
        width: MediaQuery.of(context).size.width,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: TabBar(
              tabs: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: qrIcon,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: cameraIcon,
                ),
              ],
            ),
             body:
            TabBarView(
              children: <Widget>[
                QrCodeView(),
                CameraView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}