import 'package:flutter/material.dart';

class PageExplanationSection extends StatelessWidget {
	const PageExplanationSection({
		Key key,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.symmetric(
				vertical: MediaQuery.of(context).size.height * 0.05,
				horizontal: MediaQuery.of(context).size.width * 0.1
			),
			child: Text(
				"You can generate QR-Codes to\n" +
					"e.g. print and put at doors/buildings.\n" +
					"\nEveryone that enters and leaves the location scans the code so FLATTEN" +
					" knows whom you had contact with.",
				textAlign: TextAlign.center,
				style: TextStyle(
					fontSize: 18,
					color: Color(0xff033076)
				)
			),
		);
	}
}