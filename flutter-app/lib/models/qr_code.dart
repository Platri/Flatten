class QrCode {
   String id;
   String createDateTime;
   String name;
   int useCase;
   String additionalInformation;
   bool active;
   int status;

  QrCode({this.id, this.createDateTime, this.name, this.useCase,
      this.additionalInformation, this.active, this.status});

  factory QrCode.fromJson(Map<String, dynamic> json){
      return QrCode(
         id: json["id"],
        createDateTime: json["createDateTime"],
        name: json["name"],
        useCase :json["useCase"],
        additionalInformation : json["additionalInformation"],
        active: json["active"],
        status: json["status"]
      );
  
  }
}
