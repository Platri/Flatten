import 'package:flutter/material.dart';

class SuccessMessage extends StatelessWidget {
	const SuccessMessage({
		Key key,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Text("Successful Scan!",
			style: TextStyle(
				fontSize: 18,
				fontWeight: FontWeight.bold,
				color: Color(0xff033076)
			)
		);
	}
}