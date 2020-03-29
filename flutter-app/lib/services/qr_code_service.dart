import 'dart:convert';
import 'package:flatten/models/api_response.dart';
import 'package:flatten/models/qr_code.dart';
import 'package:flatten/models/qr_code_add.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class QR_Code_Service {
  static const API = 'https://api.flatten-app.de';
  static const headers = {
    'Content-Type': 'application/json'
  };
}

Future<APIResponse<bool>> upLoadQR(){
  
}