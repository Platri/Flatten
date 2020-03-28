import 'home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flatten/services/auth.dart';
import 'package:flatten/ui/sign_in_page.dart';
///this class checks whether the current user is logged in or not
///and shows the page accordingly
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    return StreamBuilder(
      stream: auth.userStream,
      initialData: null,
      builder: (context, snapshot){
      //  this can be used to show a progress indicator when we authenticate from database,
      //  we can un-comment this.
      //  if(snapshot.connectionState == ConnectionState.active){
          User user = snapshot.data;
          if(user == null){
            return SignInPage();
          }
          return HomePage(user: user,);
        }
        // this is the progress indicator
        // else{
        //   return Scaffold(body: Center(child: CircularProgressIndicator()));
        // }
    //  },
    );
  }
}