import 'package:flutter/foundation.dart';

class QR_Code_For_Add {
  String name;
  var useCase;
  String gpsPosition;
  String additionalInformation;
  String active;
  String status;

  QR_Code_For_Add({
    @required this.name,
    @required this.useCase,
    @required this.gpsPosition,
    @required this.additionalInformation,
    @required this.active,
    @required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "useCase": useCase,
      "gpsPosition": gpsPosition,
      "additionalInformation": additionalInformation,
      "active": active,
      "status": status
    };
  }
}
