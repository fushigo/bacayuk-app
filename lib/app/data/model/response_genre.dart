class ResponseGenre {
  ResponseGenre({
      this.message, 
      this.total, 
      this.data,});

  ResponseGenre.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataGenre.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<DataGenre>? data;

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

class DataGenre {
  DataGenre({
      this.genreID, 
      this.nama, 
      this.createdAt, 
      this.updatedAt,});

  DataGenre.fromJson(dynamic json) {
    genreID = json['GenreID'];
    nama = json['Nama'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? genreID;
  String? nama;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['GenreID'] = genreID;
    map['Nama'] = nama;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}