class ResponseBook {
  ResponseBook({
      this.message, 
      this.total, 
      this.data,});

  ResponseBook.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BookData.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<BookData>? data;

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

class BookData {
  BookData({
      this.bukuID, 
      this.judul, 
      this.sinopsis, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.cover, 
      this.createdAt, 
      this.updatedAt, 
      this.genreRelasi, 
      this.kategoriBukuRelasi,});

  BookData.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    judul = json['Judul'];
    sinopsis = json['Sinopsis'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    cover = json['Cover'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['genreRelasi'] != null) {
      genreRelasi = [];
      json['genreRelasi'].forEach((v) {
        genreRelasi?.add(GenreRelasi.fromJson(v));
      });
    }
    if (json['KategoriBuku_Relasi'] != null) {
      kategoriBukuRelasi = [];
      json['KategoriBuku_Relasi'].forEach((v) {
        kategoriBukuRelasi?.add(KategoriBukuRelasi.fromJson(v));
      });
    }
  }
  int? bukuID;
  String? judul;
  String? sinopsis;
  String? penulis;
  String? penerbit;
  int? tahunTerbit;
  String? cover;
  String? createdAt;
  String? updatedAt;
  List<GenreRelasi>? genreRelasi;
  List<KategoriBukuRelasi>? kategoriBukuRelasi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Judul'] = judul;
    map['Sinopsis'] = sinopsis;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['TahunTerbit'] = tahunTerbit;
    map['Cover'] = cover;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (genreRelasi != null) {
      map['genreRelasi'] = genreRelasi?.map((v) => v.toJson()).toList();
    }
    if (kategoriBukuRelasi != null) {
      map['KategoriBuku_Relasi'] = kategoriBukuRelasi?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class KategoriBukuRelasi {
  KategoriBukuRelasi({
      this.kategoriBuku,});

  KategoriBukuRelasi.fromJson(dynamic json) {
    kategoriBuku = json['KategoriBuku'] != null ? KategoriBuku.fromJson(json['KategoriBuku']) : null;
  }
  KategoriBuku? kategoriBuku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (kategoriBuku != null) {
      map['KategoriBuku'] = kategoriBuku?.toJson();
    }
    return map;
  }

}

class KategoriBuku {
  KategoriBuku({
      this.namaKategori,});

  KategoriBuku.fromJson(dynamic json) {
    namaKategori = json['NamaKategori'];
  }
  String? namaKategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['NamaKategori'] = namaKategori;
    return map;
  }

}

class GenreRelasi {
  GenreRelasi({
      this.genre,});

  GenreRelasi.fromJson(dynamic json) {
    genre = json['Genre'] != null ? Genre.fromJson(json['Genre']) : null;
  }
  Genre? genre;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genre != null) {
      map['Genre'] = genre?.toJson();
    }
    return map;
  }

}

class Genre {
  Genre({
      this.nama,});

  Genre.fromJson(dynamic json) {
    nama = json['Nama'];
  }
  String? nama;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Nama'] = nama;
    return map;
  }

}