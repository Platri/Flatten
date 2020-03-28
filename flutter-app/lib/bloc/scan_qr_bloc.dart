import 'dart:async';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:flatten/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

enum QRScannerState{Scanning, ScanSuccess}

class ScanQrBloc implements BlocBase {
	QRViewController controller;
	final List<String> scannedData = [];

	final BehaviorSubject<QRScannerState> _qrScannerStateController = BehaviorSubject.seeded(QRScannerState.Scanning);
	Sink<QRScannerState> get _inQRScannerState =>_qrScannerStateController.sink;
	Stream<QRScannerState> get outQRScannerState =>_qrScannerStateController.stream;

	void onQRViewCreated(QRViewController controller) async {
		this.controller = controller;
		controller.scannedDataStream.listen((scanData) => handleNewScannedData(scanData));
	}

	void handleNewScannedData(String data) async {
		if (!scannedData.contains(data)){
			scannedData.add(data);
			_inQRScannerState.add(QRScannerState.ScanSuccess);
			await sleep();
			_inQRScannerState.add(QRScannerState.Scanning);
		}

	}

	Future sleep() => Future.delayed(const Duration(seconds: 3), () => "3");

	@override
	void dispose() {
		controller?.dispose();
		_qrScannerStateController.close();
	}
}
