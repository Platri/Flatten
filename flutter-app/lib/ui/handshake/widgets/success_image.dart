import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class SuccessImage extends StatelessWidget {
	const SuccessImage({
		Key key,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.all(16.0),
			child: Container(
				alignment: Alignment.center,
				width: 80,
				height: 80,
				decoration: BoxDecoration(
					shape: BoxShape.circle, color: Color(0xFF88C7BC)
				),
				child: Icon(
					LineAwesomeIcons.check,
					size: 60,
					color: Colors.white,
				),
			),
		);
	}
}