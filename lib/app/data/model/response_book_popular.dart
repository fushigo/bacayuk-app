/// message : "Book found successfully"
/// data : [{"BukuID":2,"Judul":"Kimetsu no Yaiba","Penulis":"Fushigo","Penerbit":"Fugodev","TahunTerbit":2024,"Sinopsis":"Pemburu Iblis","Cover":null,"createdAt":"2024-03-13T14:04:43.839Z","updatedAt":"2024-03-13T14:04:06.154Z"},{"BukuID":1,"Judul":"Belajar Flutter","Penulis":"Fushigo","Penerbit":"Fugodev","TahunTerbit":2024,"Sinopsis":"Road Map belajar Flutter cepat dengan GetX","Cover":null,"createdAt":"2024-03-12T04:46:12.145Z","updatedAt":"2024-03-12T04:45:14.518Z"}]

class ResponseBookPopular {
  ResponseBookPopular({
      this.message, 
      this.data,});

  ResponseBookPopular.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBookPopular.fromJson(v));
      });
    }
  }
  String? message;
  List<DataBookPopular>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// BukuID : 2
/// Judul : "Kimetsu no Yaiba"
/// Penulis : "Fushigo"
/// Penerbit : "Fugodev"
/// TahunTerbit : 2024
/// Sinopsis : "Pemburu Iblis"
/// Cover : null
/// createdAt : "2024-03-13T14:04:43.839Z"
/// updatedAt : "2024-03-13T14:04:06.154Z"

class DataBookPopular {
  DataBookPopular({
      this.bukuID, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.sinopsis, 
      this.cover, 
      this.createdAt, 
      this.updatedAt,});

  DataBookPopular.fromJson(dynamic json) {
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
  dynamic cover;
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