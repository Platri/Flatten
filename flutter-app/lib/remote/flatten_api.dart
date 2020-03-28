import 'package:dio/dio.dart';

class FlattenApi {
  final String _endpoint = "https://flatten.app/apiexample";

  final Dio _dio = Dio()..interceptors.add(LogInterceptor(responseBody: true));

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
