/// message : "File found successfully"
/// data : {"FileID":1,"Nama":"BAB 1","File":"sdsdsdjwnwjnjwjwn","BukuID":1}

class ResponseFileId {
  ResponseFileId({
      this.message, 
      this.data,});

  ResponseFileId.fromJson(dynamic json) {
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

/// FileID : 1
/// Nama : "BAB 1"
/// File : "sdsdsdjwnwjnjwjwn"
/// BukuID : 1

class Data {
  Data({
      this.fileID, 
      this.nama, 
      this.file, 
      this.bukuID,});

  Data.fromJson(dynamic json) {
    fileID = json['FileID'];
    nama = json['Nama'];
    file = json['File'];
    bukuID = json['BukuID'];
  }
  int? fileID;
  String? nama;
  String? file;
  int? bukuID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FileID'] = fileID;
    map['Nama'] = nama;
    map['File'] = file;
    map['BukuID'] = bukuID;
    return map;
  }

}