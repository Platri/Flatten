import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
	SectionTitle({
		@required this.title,
	});

	final title;

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.all(8.0),
			child: SizedBox(
				width: double.infinity,
				child: Text(title,
					textAlign: TextAlign.start,
					style: TextStyle(
						fontSize: 18,
						color: Colors.blueGrey)
				),
			),
		);
	}
}