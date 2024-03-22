/// message : "Peminjaman created successfully"
/// data : {"PeminjamanID":35,"TanggalPeminjaman":"2024-03-21T00:00:00.000Z","TanggalPengembalian":"2024-12-12T00:00:00.000Z","StatusPeminjaman":"dipinjam","UserID":2,"BukuID":1,"Token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJQZW1pbmphbWFuSUQiOjM1LCJUYW5nZ2FsUGVtaW5qYW1hbiI6IjIwMjQtMDMtMjFUMDA6MDA6MDAuMDAwWiIsIlRhbmdnYWxQZW5nZW1iYWxpYW4iOiIyMDI0LTEyLTEyVDAwOjAwOjAwLjAwMFoiLCJTdGF0dXNQZW1pbmphbWFuIjoiZGlwaW5qYW0iLCJVc2VySUQiOjIsIkJ1a3VJRCI6MSwiVG9rZW4iOm51bGwsImNyZWF0ZWRBdCI6IjIwMjQtMDMtMjFUMjE6NTU6MTAuMjUxWiIsInVwZGF0ZWRBdCI6IjIwMjQtMDMtMjFUMjE6NTU6MTAuMjUxWiIsImlhdCI6MTcxMTA1ODExMSwiZXhwIjoxNzM0MDQwNTExfQ.DTUpgiUS720HJGh4aHm0_wBpjgVeCU7B8vI0GE5CePE","createdAt":"2024-03-21T21:55:10.251Z","updatedAt":"2024-03-21T21:55:11.173Z"}

class ResponsePeminjaman {
  ResponsePeminjaman({
      this.message, 
      this.data,});

  ResponsePeminjaman.fromJson(dynamic json) {
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

/// PeminjamanID : 35
/// TanggalPeminjaman : "2024-03-21T00:00:00.000Z"
/// TanggalPengembalian : "2024-12-12T00:00:00.000Z"
/// StatusPeminjaman : "dipinjam"
/// UserID : 2
/// BukuID : 1
/// Token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJQZW1pbmphbWFuSUQiOjM1LCJUYW5nZ2FsUGVtaW5qYW1hbiI6IjIwMjQtMDMtMjFUMDA6MDA6MDAuMDAwWiIsIlRhbmdnYWxQZW5nZW1iYWxpYW4iOiIyMDI0LTEyLTEyVDAwOjAwOjAwLjAwMFoiLCJTdGF0dXNQZW1pbmphbWFuIjoiZGlwaW5qYW0iLCJVc2VySUQiOjIsIkJ1a3VJRCI6MSwiVG9rZW4iOm51bGwsImNyZWF0ZWRBdCI6IjIwMjQtMDMtMjFUMjE6NTU6MTAuMjUxWiIsInVwZGF0ZWRBdCI6IjIwMjQtMDMtMjFUMjE6NTU6MTAuMjUxWiIsImlhdCI6MTcxMTA1ODExMSwiZXhwIjoxNzM0MDQwNTExfQ.DTUpgiUS720HJGh4aHm0_wBpjgVeCU7B8vI0GE5CePE"
/// createdAt : "2024-03-21T21:55:10.251Z"
/// updatedAt : "2024-03-21T21:55:11.173Z"

class Data {
  Data({
      this.peminjamanID, 
      this.tanggalPeminjaman, 
      this.tanggalPengembalian, 
      this.statusPeminjaman, 
      this.userID, 
      this.bukuID, 
      this.token, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
    tanggalPeminjaman = json['TanggalPeminjaman'];
    tanggalPengembalian = json['TanggalPengembalian'];
    statusPeminjaman = json['StatusPeminjaman'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    token = json['Token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? peminjamanID;
  String? tanggalPeminjaman;
  String? tanggalPengembalian;
  String? statusPeminjaman;
  int? userID;
  int? bukuID;
  String? token;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PeminjamanID'] = peminjamanID;
    map['TanggalPeminjaman'] = tanggalPeminjaman;
    map['TanggalPengembalian'] = tanggalPengembalian;
    map['StatusPeminjaman'] = statusPeminjaman;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['Token'] = token;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}