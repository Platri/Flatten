import 'dart:convert';
import 'package:flatten/bloc/user_bloc.dart';
import 'package:flatten/models/api_response.dart';
import 'package:flatten/models/qr_code.dart';
import 'package:flatten/models/qr_code_add.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class QR_Code_Service {
  static const API = 'https://api.flatten-app.de';
  static const headers = {'Content-Type': 'application/json'};

  Future<APIResponse<QrCode>> upLoadQR(QR_Code_For_Add item) {
    print('upLoad called');
    return http
        .post(API + '/flatten/qr-codes',
            headers: headers, body: json.encode(item.toJson())).timeout(Duration(seconds: 5))
        .then((data) {
      print('statusCode: ' + '${data.statusCode}');
      if (data.statusCode == 201) {
        final jsonData = json.decode(data.body);
        return APIResponse<QrCode>(data: QrCode.fromJson(jsonData));
      }
      return APIResponse<QrCode>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<QrCode>(error: true, errorMessage: 'An error occured'));
  }
}
