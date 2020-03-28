import 'package:flatten/models/qr_code.dart';

class QrCodeListResponse {
  final String startDate;
  final String endDate;
  final List<QrCode> data;
  final int size;

  QrCodeListResponse(this.startDate, this.endDate, this.data, this.size);

  QrCodeListResponse.fromJson(Map<String, dynamic> json)
      : startDate = json["startDate"],
        endDate = json["endDate"],
        size = json["size"],
        data = (json["data"] as List).map((i) => QrCode.fromJson(i)).toList();
}
