class Endpoint {
  static const String baseUrlApi = "https://bacayuk-api.vercel.app/api/";
  // static const String baseUrlApi = "http://127.0.0.1:3000/api/";
  // static const String baseUrlApi = "http://localhost:3000/api";

  static const String login = "${baseUrlApi}auth/signin";
  static const String register = "${baseUrlApi}auth/signup";
  static const String otp = "${baseUrlApi}auth/otp";
  static const String validasi = "${baseUrlApi}validasi";
  static const String profile = "${baseUrlApi}user/profile";
  static const String user = "${baseUrlApi}user";
}
