import 'package:flatten/bloc/create_qr_bloc.dart';
import 'package:flutter/material.dart';

import './widgets/gps_section.dart';
import './widgets/page_explanation_section.dart';
import './widgets/purpose_picker_section.dart';
import './widgets/information_section.dart';
import './widgets/name_section.dart';

class CreateQRScreen extends StatefulWidget {
  @override
  _CreateQRScreenState createState() => _CreateQRScreenState();
}

class _CreateQRScreenState extends State<CreateQRScreen> {
  CreateQrBloc bloc;

  @override
  void initState() {
    super.initState();
      bloc = CreateQrBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PageExplanationSection(),
            NameSection(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Use for:",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, color: Color(0xff033076))
              ),
            ),
            PurposeSection(bloc: bloc),
            SizedBox(height: 8,),
            GpsSection(),
            AdditionalInformationSection(),
            Center(
              child: RaisedButton(
                child: Text("Generate"),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}


enum SingingCharacter { lafayette, jefferson }