import 'package:flatten/bloc/scan_qr_bloc.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flatten/ui/handshake/widgets/code_entry_field.dart';

class CameraView extends StatefulWidget {
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  ScanQrBloc bloc;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    bloc = ScanQrBloc();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Flexible(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: bloc.onQRViewCreated,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Scan QR-Code to submit encounter",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Color(0xff033076)),
              ),
            ),
            SizedBox(height: 100, width: 400, child: CodeEntryTextField(
              onSubmit: (String pin){
                print(pin);
              },
              //use this to get access to the pin
              //this is called automatically once all the feilds are filled
            )),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
