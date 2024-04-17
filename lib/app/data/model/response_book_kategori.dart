class ResponseBookKategori {
  ResponseBookKategori({
      this.message, 
      this.total, 
      this.data,});

  ResponseBookKategori.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBookKategori.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<DataBookKategori>? data;

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

class DataBookKategori {
  DataBookKategori({
      this.bukuID, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.sinopsis, 
      this.cover, 
      this.createdAt, 
      this.updatedAt,});

  DataBookKategori.fromJson(dynamic json) {
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