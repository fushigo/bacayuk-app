class ResponseBookId {
  ResponseBookId({
      this.message, 
      this.data, 
      this.jmlhPeminjaman, 
      this.jmlahDibaca, 
      this.jmlahKoleksi,});

  ResponseBookId.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    jmlhPeminjaman = json['jmlhPeminjaman'];
    jmlahDibaca = json['jmlahDibaca'];
    jmlahKoleksi = json['jmlahKoleksi'];
  }
  String? message;
  Data? data;
  int? jmlhPeminjaman;
  int? jmlahDibaca;
  int? jmlahKoleksi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['jmlhPeminjaman'] = jmlhPeminjaman;
    map['jmlahDibaca'] = jmlahDibaca;
    map['jmlahKoleksi'] = jmlahKoleksi;
    return map;
  }

}

class Data {
  Data({
      this.bukuID, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.sinopsis, 
      this.cover, 
      this.createdAt, 
      this.updatedAt, 
      this.peminjaman, 
      this.koleksiPribadi, 
      this.ulasanBuku, 
      this.historyBaca, 
      this.genreRelasi, 
      this.file,});

  Data.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    sinopsis = json['Sinopsis'];
    cover = json['Cover'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['peminjaman'] != null) {
      peminjaman = [];
      json['peminjaman'].forEach((v) {
        peminjaman?.add(Peminjaman.fromJson(v));
      });
    }
    if (json['koleksiPribadi'] != null) {
      koleksiPribadi = [];
      json['koleksiPribadi'].forEach((v) {
        koleksiPribadi?.add(KoleksiPribadi.fromJson(v));
      });
    }
    if (json['ulasanBuku'] != null) {
      ulasanBuku = [];
      json['ulasanBuku'].forEach((v) {
        ulasanBuku?.add(UlasanBuku.fromJson(v));
      });
    }
    if (json['historyBaca'] != null) {
      historyBaca = [];
      json['historyBaca'].forEach((v) {
        historyBaca?.add(HistoryBaca.fromJson(v));
      });
    }
    if (json['genreRelasi'] != null) {
      genreRelasi = [];
      json['genreRelasi'].forEach((v) {
        genreRelasi?.add(GenreRelasi.fromJson(v));
      });
    }
    if (json['file'] != null) {
      file = [];
      json['file'].forEach((v) {
        file?.add(File.fromJson(v));
      });
    }
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
  List<Peminjaman>? peminjaman;
  List<KoleksiPribadi>? koleksiPribadi;
  List<UlasanBuku>? ulasanBuku;
  List<HistoryBaca>? historyBaca;
  List<GenreRelasi>? genreRelasi;
  List<File>? file;

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
    if (peminjaman != null) {
      map['peminjaman'] = peminjaman?.map((v) => v.toJson()).toList();
    }
    if (koleksiPribadi != null) {
      map['koleksiPribadi'] = koleksiPribadi?.map((v) => v.toJson()).toList();
    }
    if (ulasanBuku != null) {
      map['ulasanBuku'] = ulasanBuku?.map((v) => v.toJson()).toList();
    }
    if (historyBaca != null) {
      map['historyBaca'] = historyBaca?.map((v) => v.toJson()).toList();
    }
    if (genreRelasi != null) {
      map['genreRelasi'] = genreRelasi?.map((v) => v.toJson()).toList();
    }
    if (file != null) {
      map['file'] = file?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// FileID : 1
/// Nama : "BAB 1"
/// File : "sdsdsdjwnwjnjwjwn"
/// BukuID : 1

class File {
  File({
      this.fileID, 
      this.nama, 
      this.file, 
      this.bukuID,});

  File.fromJson(dynamic json) {
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

/// Genre : {"Nama":"Edukasi"}

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

/// Nama : "Edukasi"

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

/// HistoryBacaID : 1
/// Status : "reading"
/// UserID : 1
/// BukuID : 1
/// createdAt : "2024-03-20T22:36:20.133Z"
/// updatedAt : "2024-03-20T22:35:30.377Z"

class HistoryBaca {
  HistoryBaca({
      this.historyBacaID, 
      this.status, 
      this.userID, 
      this.bukuID, 
      this.createdAt, 
      this.updatedAt,});

  HistoryBaca.fromJson(dynamic json) {
    historyBacaID = json['HistoryBacaID'];
    status = json['Status'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? historyBacaID;
  String? status;
  int? userID;
  int? bukuID;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['HistoryBacaID'] = historyBacaID;
    map['Status'] = status;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

/// UlasanID : 1
/// UserID : 2
/// BukuID : 1
/// Ulasan : "Wah bagus sekali"
/// Rating : 5
/// createdAt : "2024-03-20T22:37:30.042Z"
/// updatedAt : "2024-03-20T22:36:49.775Z"

class UlasanBuku {
  UlasanBuku({
      this.ulasanID, 
      this.userID, 
      this.bukuID, 
      this.ulasan, 
      this.rating, 
      this.createdAt, 
      this.updatedAt,});

  UlasanBuku.fromJson(dynamic json) {
    ulasanID = json['UlasanID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    ulasan = json['Ulasan'];
    rating = json['Rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  int? ulasanID;
  int? userID;
  int? bukuID;
  String? ulasan;
  int? rating;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UlasanID'] = ulasanID;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['Ulasan'] = ulasan;
    map['Rating'] = rating;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

/// KoleksiID : 1

class KoleksiPribadi {
  KoleksiPribadi({
      this.koleksiID,});

  KoleksiPribadi.fromJson(dynamic json) {
    koleksiID = json['KoleksiID'];
  }
  int? koleksiID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KoleksiID'] = koleksiID;
    return map;
  }

}

/// PeminjamanID : 6

class Peminjaman {
  Peminjaman({
      this.peminjamanID,});

  Peminjaman.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
  }
  int? peminjamanID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PeminjamanID'] = peminjamanID;
    return map;
  }

}