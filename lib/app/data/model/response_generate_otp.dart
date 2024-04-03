/// message : "OTP Verification"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NywidXNlcm5hbWUiOiJhZG1pbmFqYTEyMyIsImVtYWlsIjoicml6a3kuYW5kaWthNTEwQHNtay5iZWxhamFyLmlkIiwicm9sZSI6InVzZXIiLCJzdGF0dXMiOiJ1bnZlcmlmeSIsImNvZGUiOjM3OTEsImlhdCI6MTcwOTMxODU4NywiZXhwIjoxNzA5MzE4ODg3fQ.6F24Ya6W0egBE4v9i16BRCM4QRkKmM8K9gdywPgCo_o"

class ResponseGenerateOtp {
  ResponseGenerateOtp({
      this.message, 
      this.token,});

  ResponseGenerateOtp.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

}