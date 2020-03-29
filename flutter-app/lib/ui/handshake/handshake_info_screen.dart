import 'package:flatten/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flatten/ui/handshake/hs_components/hs_info_components.dart';
import 'widgets/code_entry_field.dart';
import 'package:flatten/bloc/hs_info_block.dart';
//import 'package:pin_entry_text_field/pin_entry_text_field.dart';
// import 'widgets/code_entry_2.dart';

class HS_InfoScreen extends StatefulWidget {
  @override
  _HS_InfoScreenState createState() => _HS_InfoScreenState();
}

class _HS_InfoScreenState extends State<HS_InfoScreen> {
  @override
  Widget build(BuildContext context) {
    final hs_info_Bloc = BlocProvider.of<HS_Info_Bloc>(context);
    return SingleChildScrollView(
          child: Container(
          height: MediaQuery.of(context).size.height/1.2,
          width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onTap: (){hs_info_Bloc.onTap();},
              child: Scaffold(
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(
                      flex: 1,
                    ),
                    hsInfoIcon(
                        path: 'assets/person.png',
                        width: MediaQuery.of(context).size.width / 4),
                    Spacer(
                      flex: 1,
                    ),
                    hsInfoText(
                        text:
                            'Scan your counter. The scan will be captured for both of you',
                        width: MediaQuery.of(context).size.width / 1.2),
                    Spacer(
                      flex: 2,
                    ),
                    hsInfoIcon(
                        path: 'assets/house.png',
                        width: MediaQuery.of(context).size.width / 4),
                    Spacer(
                      flex: 1,
                    ),
                    hsInfoText(
                        text:
                            'Scan all the places you visit. These are supermarkets, workplaces, hospitals, etc. You can also create and attach codes for yourself(e.g. on your front door!)',
                        width: MediaQuery.of(context).size.width / 1.2),
                    Spacer(
                      flex: 2,
                    ),
                    SizedBox(
                      height: 100,
                      width: 400,
                      child:
                          AbsorbPointer(absorbing: true, child: CodeEntryTextField()),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    hsInfoText(
                        text:
                            'If your camera is broken you can also enter the temporary code manually.',
                        width: MediaQuery.of(context).size.width/1.2),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              
            ),
          ),
        ),
      ),
    );
  }
}
