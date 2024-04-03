import 'package:jwt_decoder/jwt_decoder.dart';

class JwtConverter {
  static Future<Map<String, dynamic>> jwtDecode(String token) async {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return decodedToken;
  }
}
