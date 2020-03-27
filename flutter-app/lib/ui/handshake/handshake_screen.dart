import 'package:flutter/material.dart';

import 'package:flatten/ui/handshake/widgets/camera_view.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'widgets/qr_view.dart';


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
    return DefaultTabController(
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
        body: TabBarView(
          children: <Widget>[
            QrCodeView(),
            CameraView()
          ],
        ),
      ),
    );
  }
}