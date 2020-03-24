import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../localizations.dart';

class HandshakeScreen extends StatefulWidget {
  @override
  _HandshakeScreenState createState() => _HandshakeScreenState();
}

class _HandshakeScreenState extends State<HandshakeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var qrText = "";
  QRViewController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                LineAwesomeIcons.qrcode,
                color: Color(0xFF08A388),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                LineAwesomeIcons.camera,
                color: Color(0xFF08A388),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  AppLocalizations.of(context).pvhtitel,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Color(0xFF08A388)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48, right: 48),
                  child: QrImage(
                    data: "nkldsfkldsfdknflsnkldfs",
                    foregroundColor: Color(0xFF08A388),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Text(
                    "Your Encounter scans this Code to submit the encouter for both of you.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Color(0xff033076)),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    "Scan QR-Code to submit encounter",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Color(0xff033076)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
