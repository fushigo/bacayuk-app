/// message : "Your email was verified"
/// data : {"UserID":3,"Username":"admin","Password":"$2b$10$O9ppS3hWSk2mY/xSqHz40efLbHUZzTEo5mLjV.9i9oKk0m6sY1Ui2","Email":"bersamaitubagus@gmail.com","NamaLengkap":"admin","Alamat":"admin","Role":"user","Status":"verify","createdAt":"2024-02-29T06:25:04.582Z","updatedAt":"2024-02-29T06:25:52.753Z"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJhZG1pbiIsImVtYWlsIjoiYmVyc2FtYWl0dWJhZ3VzQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwic3RhdHVzIjoidmVyaWZ5IiwiaWF0IjoxNzA5MTg3OTUyLCJleHAiOjE3MTE3Nzk5NTJ9.HFvCmhxms_stKfXlJcusC8eiaPpf79hH7EceY7WVOnE"

class ResponseOtp {
  ResponseOtp({
      this.message, 
      this.data, 
      this.token,});

  ResponseOtp.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }
  String? message;
  Data? data;
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

/// UserID : 3
/// Username : "admin"
/// Password : "$2b$10$O9ppS3hWSk2mY/xSqHz40efLbHUZzTEo5mLjV.9i9oKk0m6sY1Ui2"
/// Email : "bersamaitubagus@gmail.com"
/// NamaLengkap : "admin"
/// Alamat : "admin"
/// Role : "user"
/// Status : "verify"
/// createdAt : "2024-02-29T06:25:04.582Z"
/// updatedAt : "2024-02-29T06:25:52.753Z"

class Data {
  Data({
      this.userID, 
      this.username, 
      this.password, 
      this.email, 
      this.namaLengkap, 
      this.alamat, 
      this.role, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
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
    return map;
  }

}