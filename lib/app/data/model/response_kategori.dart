class ResponseKategori {
  ResponseKategori({
      this.message, 
      this.total, 
      this.data,});

  ResponseKategori.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(KategoriData.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<KategoriData>? data;

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

class KategoriData {
  KategoriData({
      this.kategoriID, 
      this.namaKategori, 
      this.createdAt, 
      this.updatedAt,});

  KategoriData.fromJson(dynamic json) {
    kategoriID = json['KategoriID'];
    namaKategori = json['NamaKategori'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? kategoriID;
  String? namaKategori;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KategoriID'] = kategoriID;
    map['NamaKategori'] = namaKategori;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}