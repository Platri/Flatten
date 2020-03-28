import 'package:flatten/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flatten/bloc/auth_bloc.dart';
import '../../../localizations.dart';

class QrCodeView extends StatelessWidget {
	const QrCodeView({
		Key key,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
     final user = BlocProvider.of<User>(context); //this gives the current logged in user
		TextStyle titleStyle = TextStyle(
			fontWeight: FontWeight.bold,
			fontSize: 24,
			color: Color(0xFF08A388)
		);

		return Column(
			mainAxisAlignment: MainAxisAlignment.spaceEvenly,
			children: <Widget>[
				Text(
           //earlier this was showing
                // AppLocalizations.of(context).pvhtitel,
                //this is changed temporarily to check user login:
                "Prename: ${user.userData['preName']}\nName: ${user.userData['name']}\nZIP: ${user.userData['zip']}",
                /*Later this can be changed to a unique is for every user, which is stored in the User class
                and can be accessed though user.userData['uid']
                */
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
