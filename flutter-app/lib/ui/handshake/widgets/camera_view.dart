import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CameraView extends StatefulWidget {
	@override
	_CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
	final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
	var qrText = "";
	QRViewController controller;

	@override
	Widget build(BuildContext context) {
		return Column(
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