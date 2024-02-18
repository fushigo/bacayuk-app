/// message : "Login successful"
/// data : {"UserID":1,"Username":"andika","Password":"$2b$10$Z7DdpKfg/jTrF74IM5qNbO7s0czXefrhZi.9g018wxstwzPVvZlmu","Email":"andikas.26@gmail.com","NamaLengkap":"Rizky Andika","Alamat":"Sukomulyo","Role":"user","createdAt":"2024-02-18T07:17:13.542Z","updatedAt":"2024-02-18T07:17:13.542Z"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJhbmRpa2EiLCJyb2xlIjoidXNlciIsImlhdCI6MTcwODI1OTQ3NywiZXhwIjoxNzEwODUxNDc3fQ.sEqxNRNvOGHKNJ3VsvBsUyuph1ZPFmoPxWS0q4tk58o"

class ResponseLogin {
  ResponseLogin({
      this.message, 
      this.data, 
      this.token,});

  ResponseLogin.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
    token = json['token'];
  }
  String? message;
  DataLogin? data;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// UserID : 1
/// Username : "andika"
/// Password : "$2b$10$Z7DdpKfg/jTrF74IM5qNbO7s0czXefrhZi.9g018wxstwzPVvZlmu"
/// Email : "andikas.26@gmail.com"
/// NamaLengkap : "Rizky Andika"
/// Alamat : "Sukomulyo"
/// Role : "user"
/// createdAt : "2024-02-18T07:17:13.542Z"
/// updatedAt : "2024-02-18T07:17:13.542Z"

class DataLogin {
  DataLogin({
      this.userID, 
      this.username, 
      this.password, 
      this.email, 
      this.namaLengkap, 
      this.alamat, 
      this.role, 
      this.createdAt, 
      this.updatedAt,});

  DataLogin.fromJson(dynamic json) {
    userID = json['UserID'];
    username = json['Username'];
    password = json['Password'];
    email = json['Email'];
    namaLengkap = json['NamaLengkap'];
    alamat = json['Alamat'];
    role = json['Role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? userID;
  String? username;
  String? password;
  String? email;
  String? namaLengkap;
  String? alamat;
  String? role;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['Username'] = username;
    map['Password'] = password;
    map['Email'] = email;
    map['NamaLengkap'] = namaLengkap;
    map['Alamat'] = alamat;
    map['Role'] = role;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}