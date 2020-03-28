class QrCode {
  final String id;
  final String createDateTime;
  final String name;
  final int useCase;
  final String additionalInformation;
  final bool active;
  final int status;

  QrCode(this.id, this.createDateTime, this.name, this.useCase,
      this.additionalInformation, this.active, this.status);

  QrCode.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        createDateTime = json["createDateTime"],
        name = json["name"],
        useCase = json["useCase"],
        additionalInformation = json["additionalInformation"],
        active = json["active"],
        status = json["status"];
}
