import 'package:flutter/material.dart';

class SubSection extends StatelessWidget {
	SubSection({
		@required this.title,
		@required this.data
	});

	final String title;
	final Widget data;

	@override
	Widget build(BuildContext context) {
		TextStyle style = TextStyle(
			fontSize: 14,
			fontWeight: FontWeight.bold,
			color: Color(0xff033076));

		return  Padding(
			padding: const EdgeInsets.only(left: 32, right: 32),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					Text(title,
						textAlign: TextAlign.start,
						style: style
					),
					data
				],
			),
		);
	}
}