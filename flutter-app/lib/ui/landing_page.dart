import 'package:flatten/bloc/bloc_provider.dart';
import 'package:flatten/bloc/hs_info_block.dart';
import 'package:flatten/bloc/user_bloc.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';
import 'package:flatten/bloc/auth_bloc.dart';
import 'package:flatten/ui/sign_in_page.dart';
///this class checks whether the current user is logged in or not
///and shows the page accordingly
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Auth_Bloc auth = BlocProvider.of<Auth_Bloc>(context);
    return StreamBuilder(
      stream: auth.userStream,
      initialData: null,
      builder: (context, snapshot){
      //  this can be used to show a progress indicator when we authenticate from database,
      //  we can un-comment this.
      //  if(snapshot.connectionState == ConnectionState.active){
          User_Bloc user = snapshot.data;
          if(user == null){
            return SignInPage();
          }
          return BlocProvider<HS_Info_Bloc>(bloc: HS_Info_Bloc() ,child: HomePage(user: user,));
        }
        // this is the progress indicator
        // else{
        //   return Scaffold(body: Center(child: CircularProgressIndicator()));
        // }
    //  },
    );
  }
}