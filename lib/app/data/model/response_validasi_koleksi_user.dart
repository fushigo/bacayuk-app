class ResponseValidasiKoleksiUser {
  ResponseValidasiKoleksiUser({
      this.message, 
      this.data,});

  ResponseValidasiKoleksiUser.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.koleksiID, 
      this.userID, 
      this.bukuID, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    koleksiID = json['KoleksiID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? koleksiID;
  int? userID;
  int? bukuID;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KoleksiID'] = koleksiID;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}