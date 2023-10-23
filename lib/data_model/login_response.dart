import 'package:receipe_app/data_model/credentials.dart';
import 'package:receipe_app/data_model/user.dart';

class LoginResponse {
  String? status;
  User? user;
  Credentials? credentials;

  LoginResponse({
    this.status,
    this.user,
    this.credentials,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['success'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    credentials = json['credentials'] != null
        ? Credentials.fromJson(json['credentials'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (credentials != null) {
      data['credentials'] = credentials!.toJson();
    }
    return data;
  }
}
