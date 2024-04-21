class ResponseUserAll {
  ResponseUserAll({
      this.message, 
      this.total, 
      this.data,});

  ResponseUserAll.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataUserAll.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<DataUserAll>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['total'] = total;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DataUserAll {
  DataUserAll({
      this.userID, 
      this.namaLengkap, 
      this.alamat, 
      this.username, 
      this.email, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  DataUserAll.fromJson(dynamic json) {
    userID = json['UserID'];
    namaLengkap = json['NamaLengkap'];
    alamat = json['Alamat'];
    username = json['Username'];
    email = json['Email'];
    status = json['Status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? userID;
  String? namaLengkap;
  String? alamat;
  String? username;
  String? email;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['NamaLengkap'] = namaLengkap;
    map['Alamat'] = alamat;
    map['Username'] = username;
    map['Email'] = email;
    map['Status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}