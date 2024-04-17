class ResponseHistoryId {
  ResponseHistoryId({
      this.message, 
      this.total, 
      this.data,});

  ResponseHistoryId.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataHistoryId.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<DataHistoryId>? data;

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

class DataHistoryId {
  DataHistoryId({
      this.historyBacaID, 
      this.status, 
      this.userID, 
      this.bukuID, 
      this.createdAt, 
      this.updatedAt, 
      this.buku,});

  DataHistoryId.fromJson(dynamic json) {
    historyBacaID = json['HistoryBacaID'];
    status = json['Status'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    buku = json['Buku'] != null ? Buku.fromJson(json['Buku']) : null;
  }
  int? historyBacaID;
  String? status;
  int? userID;
  int? bukuID;
  String? createdAt;
  String? updatedAt;
  Buku? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['HistoryBacaID'] = historyBacaID;
    map['Status'] = status;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (buku != null) {
      map['Buku'] = buku?.toJson();
    }
    return map;
  }

}

class Buku {
  Buku({
      this.bukuID, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.sinopsis, 
      this.cover, 
      this.createdAt, 
      this.updatedAt,});

  Buku.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    sinopsis = json['Sinopsis'];
    cover = json['Cover'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? bukuID;
  String? judul;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  String? sinopsis;
  String? cover;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['TahunTerbit'] = tahunTerbit;
    map['Sinopsis'] = sinopsis;
    map['Cover'] = cover;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}