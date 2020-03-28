import 'package:flatten/bloc/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'handshake_info_screen.dart';
import 'handshake_screen.dart';
import 'package:flatten/bloc/hs_info_block.dart';


class HandShakeDecider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hsBloc = BlocProvider.of<HS_Info_Bloc>(context);
    return StreamBuilder(
      stream: hsBloc.currentState,
      initialData: true,
      builder: (context, snapshot){
        if(snapshot.data == true){
          return HS_InfoScreen();
        }else{
          return HandshakeScreen();
        }
      },
    );
  }
}