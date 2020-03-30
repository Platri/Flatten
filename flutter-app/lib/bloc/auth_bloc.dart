import 'dart:async';
import 'package:flatten/bloc/bloc_provider.dart';
import 'package:flatten/bloc/user_bloc.dart';
import 'package:flatten/models/api_response.dart';
import 'package:flatten/services/qr_code_service.dart';
import 'package:flatten/models/qr_code_add.dart';
import 'package:flatten/models/qr_code.dart';

///this class can be modified to do authenticaion, once we have a database ready, we just have to
///add the sign-in logic in the singIn() method and enter the user details, we can also add a method here to
///check whether the user already exists in our database or not
class Auth_Bloc implements BlocBase {

  StreamController _usercontroller = StreamController<User_Bloc>();
  StreamController _isAuthenticating = StreamController<AuthState>();

  Stream get userStream => _usercontroller.stream;
  Stream get isAuthenticationStream => _isAuthenticating.stream;

  void _setUser(User_Bloc user) => _usercontroller.add(user);
  void _setIsAuthenicating(AuthState authState) => _isAuthenticating.add(authState);

  void dispose() {
    _usercontroller.close();
    _isAuthenticating.close();
  }

  void signIn(String preName, String name, String zip) async{
    final qr_code_for_add = QR_Code_For_Add(
        name: name,
        useCase: 1,
        active: true,
        additionalInformation: "",
        gpsPosition: zip,
        status: 1);
    QR_Code_Service service = QR_Code_Service();
    _setIsAuthenicating(AuthState(inProgress: true, errorOccured: false));
   final APIResponse<QrCode> qrCodeData = await service.upLoadQR(qr_code_for_add);
   final QrCode qrCode = qrCodeData.data;
   if(!qrCodeData.error){
    User_Bloc user = User_Bloc(name: qrCode.name, uid: qrCode.id, preName: preName, zip: zip);
    _setIsAuthenicating(AuthState(inProgress : false, errorOccured: false));
    _setUser(user);
   }else{
     _setIsAuthenicating(AuthState(inProgress:false, errorOccured: true));
   }
  }
}

class AuthState{
  AuthState({this.inProgress, this.errorOccured});
  bool inProgress;
  bool errorOccured;
}
