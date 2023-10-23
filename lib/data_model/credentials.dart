class Credentials {
  String? accessToken;
  String? refreshToken;

  Credentials({
    this.accessToken,
    this.refreshToken,
  });

  Credentials.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
