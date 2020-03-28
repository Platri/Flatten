import 'dart:async';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:flatten/bloc/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class ScanQrBloc implements BlocBase {
	QRViewController controller;

	final BehaviorSubject<bool> _qrCodeFoundController = BehaviorSubject.seeded(false);
	Sink<bool> get _inQrCodeFound =>_qrCodeFoundController.sink;
	Stream<bool> get outQrCodeFound =>_qrCodeFoundController.stream;

	void _handleIncomingQrValue(String qrValue) => _inQrCodeFound.add(true);

	void onQRViewCreated(QRViewController controller) {
		this.controller = controller;
		controller.scannedDataStream.listen((scanData) => _inQrCodeFound.add(true));
	}

	@override
	void dispose() {
		controller?.dispose();
		_qrCodeFoundController.close();
	}
}
