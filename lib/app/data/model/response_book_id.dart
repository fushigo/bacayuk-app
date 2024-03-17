/// message : "Book found successfully"
/// data : {"BukuID":5,"Judul":"Bahasa Indonesia Kelas XI","Penulis":"Suherli, Maman Suryaman, Aji Septiaji, Istiqomah","Penerbit":"Pusat Kurikulum dan Perbukuan, Balitbang, Kemendikbud","TahunTerbit":2017,"Sinopsis":"Buku pelajaran Bahasa Indonesia untuk Kelas X","Cover":"iVBORw0KGgoAAAANSUhEUgAAALoAAAD6CAIAAACZNMrKAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAAGYktHRAD/AP8A/6C9p5MAdXRob3IANjgsIDAsIDEwMSwgMCwgMTA4LCAwLCAxMDgsIDAsIDAsIDDmRm2eAAAANXpUWHR1bmtub3duAABIie3GsQkAIAwAsFd6QAepDv3/sk6CLwiBDKnOqH0y1tXPAQAAgO8Nv02VLhdvx9QAAAAmdEVYdHhtcDpDcmVhdGVEYXRlADIwMjAtMTAtMzBUMTQ6NTE6MTIuNzc4WVWzsQAAAABJRU5ErkJggg==","File":"JVBERi0xLjQKJcfsj6IKNiAwIG9iago8PC9MZW5ndGggNyAwIFIvRmlsdGVyIC9GbGF0ZURlY29kZT4+CnN0cmVhbQp4nO1QOw7CMAzdcwqfwHWcOCU7EnPLwAEQgqEFAQPXJwnNBwQ3QBlsP/s9v/wMCBuIAoDNEQ1MkEyNUQzQUE3QTgwNEQyQzI+PEI4OENDMTcxODg4QzRENTJBMjVEM0FBN0E4MDREMkMyPl0KPj4Kc3RhcnR4cmVmCjIzMjA4MjkKJSVFT0YK","createdAt":"2024-03-16T04:31:19.934Z","updatedAt":"2024-03-16T09:22:46.425Z","peminjaman":[{"PeminjamanID":1}],"bookmark":[{"KoleksiID":1}],"historyBaca":[{"HistoryBacaID":1,"Status":"reading","UserID":1,"BukuID":5,"createdAt":"2024-03-17T00:29:58.752Z","updatedAt":"2024-03-17T00:29:41.354Z"}],"ulasanBuku":[{"UlasanID":1,"UserID":1,"BukuID":5,"Ulasan":"Buku ini sangat bagus","Rating":5,"createdAt":"2024-03-17T06:57:13.042Z","updatedAt":"2024-03-17T06:56:41.234Z"}],"genreRelasi":[{"Genre":{"Nama":"Education"}}]}
/// jmlhPeminjaman : 1
/// jmlahDibaca : 1
/// jmlahKoleksi : 1

class ResponseBookId {
  ResponseBookId({
      this.message, 
      this.data, 
      this.jmlhPeminjaman, 
      this.jmlahDibaca, 
      this.jmlahKoleksi,});

  ResponseBookId.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataBookId.fromJson(json['data']) : null;
    jmlhPeminjaman = json['jmlhPeminjaman'];
    jmlahDibaca = json['jmlahDibaca'];
    jmlahKoleksi = json['jmlahKoleksi'];
  }
  String? message;
  DataBookId? data;
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

/// BukuID : 5
/// Judul : "Bahasa Indonesia Kelas XI"
/// Penulis : "Suherli, Maman Suryaman, Aji Septiaji, Istiqomah"
/// Penerbit : "Pusat Kurikulum dan Perbukuan, Balitbang, Kemendikbud"
/// TahunTerbit : 2017
/// Sinopsis : "Buku pelajaran Bahasa Indonesia untuk Kelas X"
/// Cover : "iVBORw0KGgoAAAANSUhEUgAAALoAAAD6CAIAAACZNMrKAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAAGYktHRAD/AP8A/6C9p5MAdXRob3IANjgsIDAsIDEwMSwgMCwgMTA4LCAwLCAxMDgsIDAsIDAsIDDmRm2eAAAANXpUWHR1bmtub3duAABIie3GsQkAIAwAsFd6QAepDv3/sk6CLwiBDKnOqH0y1tXPAQAAgO8Nv02VLhdvx9QAAAAmdEVYdHhtcDpDcmVhdGVEYXRlADIwMjAtMTAtMzBUMTQ6NTE6MTIuNzc4WVWzsQAAAABJRU5ErkJggg=="
/// File : "JVBERi0xLjQKJcfsj6IKNiAwIG9iago8PC9MZW5ndGggNyAwIFIvRmlsdGVyIC9GbGF0ZURlY29kZT4+CnN0cmVhbQp4nO1QOw7CMAzdcwqfwHWcOCU7EnPLwAEQgqEFAQPXJwnNBwQ3QBlsP/s9v/wMCBuIAoDNEQ1MkEyNUQzQUE3QTgwNEQyQzI+PEI4OENDMTcxODg4QzRENTJBMjVEM0FBN0E4MDREMkMyPl0KPj4Kc3RhcnR4cmVmCjIzMjA4MjkKJSVFT0YK"
/// createdAt : "2024-03-16T04:31:19.934Z"
/// updatedAt : "2024-03-16T09:22:46.425Z"
/// peminjaman : [{"PeminjamanID":1}]
/// bookmark : [{"KoleksiID":1}]
/// historyBaca : [{"HistoryBacaID":1,"Status":"reading","UserID":1,"BukuID":5,"createdAt":"2024-03-17T00:29:58.752Z","updatedAt":"2024-03-17T00:29:41.354Z"}]
/// ulasanBuku : [{"UlasanID":1,"UserID":1,"BukuID":5,"Ulasan":"Buku ini sangat bagus","Rating":5,"createdAt":"2024-03-17T06:57:13.042Z","updatedAt":"2024-03-17T06:56:41.234Z"}]
/// genreRelasi : [{"Genre":{"Nama":"Education"}}]

class DataBookId {
  DataBookId({
      this.bukuID, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.sinopsis, 
      this.cover, 
      this.file, 
      this.createdAt, 
      this.updatedAt, 
      this.peminjaman, 
      this.bookmark, 
      this.historyBaca, 
      this.ulasanBuku, 
      this.genreRelasi,});

  DataBookId.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    sinopsis = json['Sinopsis'];
    cover = json['Cover'];
    file = json['File'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['peminjaman'] != null) {
      peminjaman = [];
      json['peminjaman'].forEach((v) {
        peminjaman?.add(Peminjaman.fromJson(v));
      });
    }
    if (json['bookmark'] != null) {
      bookmark = [];
      json['bookmark'].forEach((v) {
        bookmark?.add(Bookmark.fromJson(v));
      });
    }
    if (json['historyBaca'] != null) {
      historyBaca = [];
      json['historyBaca'].forEach((v) {
        historyBaca?.add(HistoryBaca.fromJson(v));
      });
    }
    if (json['ulasanBuku'] != null) {
      ulasanBuku = [];
      json['ulasanBuku'].forEach((v) {
        ulasanBuku?.add(UlasanBuku.fromJson(v));
      });
    }
    if (json['genreRelasi'] != null) {
      genreRelasi = [];
      json['genreRelasi'].forEach((v) {
        genreRelasi?.add(GenreRelasi.fromJson(v));
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
  String? file;
  String? createdAt;
  String? updatedAt;
  List<Peminjaman>? peminjaman;
  List<Bookmark>? bookmark;
  List<HistoryBaca>? historyBaca;
  List<UlasanBuku>? ulasanBuku;
  List<GenreRelasi>? genreRelasi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['TahunTerbit'] = tahunTerbit;
    map['Sinopsis'] = sinopsis;
    map['Cover'] = cover;
    map['File'] = file;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (peminjaman != null) {
      map['peminjaman'] = peminjaman?.map((v) => v.toJson()).toList();
    }
    if (bookmark != null) {
      map['bookmark'] = bookmark?.map((v) => v.toJson()).toList();
    }
    if (historyBaca != null) {
      map['historyBaca'] = historyBaca?.map((v) => v.toJson()).toList();
    }
    if (ulasanBuku != null) {
      map['ulasanBuku'] = ulasanBuku?.map((v) => v.toJson()).toList();
    }
    if (genreRelasi != null) {
      map['genreRelasi'] = genreRelasi?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Genre : {"Nama":"Education"}

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

/// Nama : "Education"

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

/// UlasanID : 1
/// UserID : 1
/// BukuID : 5
/// Ulasan : "Buku ini sangat bagus"
/// Rating : 5
/// createdAt : "2024-03-17T06:57:13.042Z"
/// updatedAt : "2024-03-17T06:56:41.234Z"

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

/// HistoryBacaID : 1
/// Status : "reading"
/// UserID : 1
/// BukuID : 5
/// createdAt : "2024-03-17T00:29:58.752Z"
/// updatedAt : "2024-03-17T00:29:41.354Z"

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

/// KoleksiID : 1

class Bookmark {
  Bookmark({
      this.koleksiID,});

  Bookmark.fromJson(dynamic json) {
    koleksiID = json['KoleksiID'];
  }
  int? koleksiID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KoleksiID'] = koleksiID;
    return map;
  }

}

/// PeminjamanID : 1

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