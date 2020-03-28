import 'package:flatten/bloc/create_qr_bloc.dart';
import 'package:flutter/material.dart';

class PurposeSection extends StatelessWidget {
	const PurposeSection({
		Key key,
		@required this.bloc,
	}) : super(key: key);

	final CreateQrBloc bloc;

	@override
	Widget build(BuildContext context) {
		return StreamBuilder<String>(
			stream: bloc.outPurpose,
			builder: (context, snapshot) {
				if (!snapshot.hasData)
					return Container();

				String purpose = snapshot.data;

				return PurposePicker(purpose: purpose, bloc: bloc);
			}
		);
	}
}


class PurposePicker extends StatelessWidget {
	const PurposePicker({
		Key key,
		@required this.purpose,
		@required this.bloc,
	}) : super(key: key);

	final String purpose;
	final CreateQrBloc bloc;

	@override
	Widget build(BuildContext context) {
		TextStyle optionStyle =  TextStyle(fontSize: 18, color: Color(0xff033076));

		return Row(
			mainAxisAlignment: MainAxisAlignment.spaceEvenly,
			children: <Widget>[
				Radio(
					value: "company",
					groupValue: purpose,
					onChanged: (value) => bloc.inPurpose.add(value)
				),
				Text("company", style: optionStyle),
				Radio(
					value: "private",
					groupValue: purpose,
					onChanged: (value) => bloc.inPurpose.add(value)
				),
				Text("private", style: optionStyle),
			],
		);
	}
}