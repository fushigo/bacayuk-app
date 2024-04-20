class ResponseUlasanBookid {
  ResponseUlasanBookid({
      this.message, 
      this.total, 
      this.data,});

  ResponseUlasanBookid.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataUlasanBookId.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<DataUlasanBookId>? data;

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

class DataUlasanBookId {
  DataUlasanBookId({
      this.ulasanID, 
      this.userID, 
      this.bukuID, 
      this.ulasan, 
      this.rating, 
      this.createdAt, 
      this.updatedAt, 
      this.user,});

  DataUlasanBookId.fromJson(dynamic json) {
    ulasanID = json['UlasanID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    ulasan = json['Ulasan'];
    rating = json['Rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }
  int? ulasanID;
  int? userID;
  int? bukuID;
  String? ulasan;
  int? rating;
  String? createdAt;
  String? updatedAt;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UlasanID'] = ulasanID;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['Ulasan'] = ulasan;
    map['Rating'] = rating;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (user != null) {
      map['User'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.userID, 
      this.username, 
      this.password, 
      this.email, 
      this.namaLengkap, 
      this.alamat, 
      this.role, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.profile,});

  User.fromJson(dynamic json) {
    userID = json['UserID'];
    username = json['Username'];
    password = json['Password'];
    email = json['Email'];
    namaLengkap = json['NamaLengkap'];
    alamat = json['Alamat'];
    role = json['Role'];
    status = json['Status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    profile = json['Profile'] != null ? Profile.fromJson(json['Profile']) : null;
  }
  int? userID;
  String? username;
  String? password;
  String? email;
  String? namaLengkap;
  String? alamat;
  String? role;
  String? status;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['Username'] = username;
    map['Password'] = password;
    map['Email'] = email;
    map['NamaLengkap'] = namaLengkap;
    map['Alamat'] = alamat;
    map['Role'] = role;
    map['Status'] = status;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (profile != null) {
      map['Profile'] = profile?.toJson();
    }
    return map;
  }

}

class Profile {
  Profile({
      this.gambar,});

  Profile.fromJson(dynamic json) {
    gambar = json['Gambar'];
  }
  String? gambar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Gambar'] = gambar;
    return map;
  }

}