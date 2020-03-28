import 'package:flatten/bloc/scan_qr_bloc.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CameraView extends StatefulWidget {
	@override
	_CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
	ScanQrBloc bloc;
	final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

	@override
	void initState() {
		super.initState();
		bloc = ScanQrBloc();
	}

	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				Expanded(
					flex: 5,
					child: QRView(
						key: qrKey,
						onQRViewCreated: bloc.onQRViewCreated,
					),
				),
				StreamBuilder<QRScannerState>(
				  stream: bloc.outQRScannerState,
				  builder: (context, snapshot) {
				  	if (!snapshot.hasData)
				  		return LimitedBox();

				  	Map<QRScannerState, String> messageOfQRStatus = {
						  QRScannerState.Scanning : "Scan QR-Code to submit encounter",
						  QRScannerState.ScanSuccess : "QR code scanned succesfully",
					  };
				    return Padding(
				      padding: const EdgeInsets.all(24.0),
				      child: Text(
				        messageOfQRStatus[snapshot.data],
				        textAlign: TextAlign.center,
				        style: TextStyle(
					        fontSize: 18,
					        color: snapshot.data == QRScannerState.Scanning
					         ? Color(0xff033076)
						       : Colors.green
				        ),
				      ),
				    );
				  }
				)
			],
		);
	}

	@override
	void dispose() {
		super.dispose();
	}
}