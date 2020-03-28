import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../localizations.dart';

class QrCodeView extends StatelessWidget {
	const QrCodeView({
		Key key,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		TextStyle titleStyle = TextStyle(
			fontWeight: FontWeight.bold,
			fontSize: 24,
			color: Color(0xFF08A388)
		);

		return Column(
			mainAxisAlignment: MainAxisAlignment.spaceEvenly,
			children: <Widget>[
				Text(
					AppLocalizations.of(context).pvhtitel,
					style: titleStyle
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
		);
	}
}
