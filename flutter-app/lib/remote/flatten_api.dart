import 'package:dio/dio.dart';
import 'package:flatten/remote/responses/qr_code_response.dart';

class FlattenApi {
  final String _endpoint = "https://api.flatten-app.de/flatten";

  final Dio _dio = Dio()..interceptors.add(LogInterceptor(responseBody: true));

  Future<QrCodeListResponse> getQrCode() async {
    try {
      Response response = await _dio.get("$_endpoint/qr-code");

      return QrCodeListResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<bool> postQrCode(String code) async {
    try {
      Response response =
          await _dio.post("$_endpoint/qr-code", data: {"scanned?": code});

      return response.statusCode == 200;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<bool> getHealthLogbook() async {
    try {
      Response response = await _dio.get("$_endpoint/health-logbook");

      return response.statusCode == 200;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<bool> postHealthLogbookEntry(String healthdata) async {
    try {
      Response response = await _dio.post("$_endpoint/health-logbook",
          data: {"SomeMoreParamsHealthData": healthdata});

      return response.statusCode == 200;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }

  Future<bool> handshakeExample() async {
    try {
      Response response = await _dio
          .post("$_endpoint/handhake", data: {"id": 1, "name": "Jonas"});

      return response.statusCode == 200;
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return false;
    }
  }
}
