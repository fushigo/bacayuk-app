class Endpoint {
  // static const String baseUrlApi = "https://bacayuk-api.vercel.app/api/";
  // static const String baseUrlApi = "http://192.168.4.183:3000/api/";
  static const String baseUrlApi = "http://192.168.99.120:3000/api/";

  static const String login = "${baseUrlApi}auth/signin";
  static const String register = "${baseUrlApi}auth/signup";
  static const String otp = "${baseUrlApi}auth/otp";
  static const String validasi = "${baseUrlApi}validasi";
  static const String profile = "${baseUrlApi}user/profile";
  static const String user = "${baseUrlApi}user";
  static const String book = "${baseUrlApi}buku";
  static const String bookPopular = "${baseUrlApi}buku/popular";
  static const String peminjaman = "${baseUrlApi}peminjaman";
  static const String file = "${baseUrlApi}file";
  static const String genre = "${baseUrlApi}genre";
}
