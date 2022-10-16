import 'package:shamo_app/model/user.dart';

class LoginResponse {
  String? access_token;
  String? token_type;
  User? user;

  LoginResponse({this.access_token, this.token_type, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    access_token = json['access_token'];
    token_type = json['token_type'];
    if (json['user'] != null) {
      user = new User.fromJson(json['user']);
      user!.token = "Bearer " + json['access_token'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.access_token;
    data['token_type'] = this.token_type;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
