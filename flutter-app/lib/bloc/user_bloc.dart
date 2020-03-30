
import 'package:flatten/bloc/bloc_provider.dart';
import 'package:flutter/foundation.dart';

/// this is the user modal, and we can use this to access current user data
/// once they are logged in


class User_Bloc implements BlocBase{
  User_Bloc({@required this.uid, @required this.preName, @required this.name, @required this.zip});
  final String uid;
  final String preName;
  final String name;
  final String zip;

  void dispose(){
    
  }
  
  Map<String, String> get userData => {'uid' : uid, 'preName': preName, 'name': name, 'zip': zip};
}
