import 'dart:async';
import 'package:flatten/bloc/bloc_provider.dart';
import 'package:flutter/foundation.dart';
/// this is the user modal, and we can use this to access current user data
/// once they are logged in
class User implements BlocBase{
  User({@required this.uid, @required this.preName, @required this.name, @required this.zip});
  final String uid;
  final String preName;
  final String name;
  final String zip;

  void dispose(){
    
  }
  
  Map<String, String> get userData => {'uid' : uid, 'preName': preName, 'name': name, 'zip': zip};
}


///this class can be modified to do authenticaion, once we have a database ready, we just have to 
///add the sign-in logic in the singIn() method and enter the user details, we can also add a method here to
///check whether the user already exists in our database or not
class Auth implements BlocBase {
  StreamController _controller = StreamController<User>();
  Stream get userStream => _controller.stream;

  void _setUser(User user) => _controller.add(user);

  void dispose(){
    _controller.close();
  } 
 
 void signIn(String uid, String preName, String name, String zip){
   User user = User(name: name, uid: uid, preName: preName, zip: zip);
   _setUser(user);
 }
  
}