class ResponsePeminjamanUserid {
  ResponsePeminjamanUserid({
      this.message, 
      this.total, 
      this.data,});

  ResponsePeminjamanUserid.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataPeminjamanUserid.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<DataPeminjamanUserid>? data;

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

class DataPeminjamanUserid {
  DataPeminjamanUserid({
      this.peminjamanID, 
      this.tanggalPeminjaman, 
      this.tanggalPengembalian, 
      this.statusPeminjaman, 
      this.userID, 
      this.bukuID, 
      this.token, 
      this.createdAt, 
      this.updatedAt, 
      this.buku,});

  DataPeminjamanUserid.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
    tanggalPeminjaman = json['TanggalPeminjaman'];
    tanggalPengembalian = json['TanggalPengembalian'];
    statusPeminjaman = json['StatusPeminjaman'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    token = json['Token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    buku = json['Buku'] != null ? Buku.fromJson(json['Buku']) : null;
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
  Buku? buku;

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