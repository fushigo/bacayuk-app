/// message : "OTP Verification"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJmdXNoaWdvIiwiZW1haWwiOiJmdXNoaWdvMTdAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJzdGF0dXMiOiJ1bnZlcmlmeSIsImNvZGUiOjUxOTQsImlhdCI6MTcwOTE2NjY2OCwiZXhwIjoxNzA5MTY2OTY4fQ.9oH3xHrVAGRJKVdApZCYo89CV9J_jdWcfL9R0FUMmgo"

class ResponseRegister {
  ResponseRegister({
      this.message, 
      this.token,});

  ResponseRegister.fromJson(dynamic json) {
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