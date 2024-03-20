class AuthenticationModel {
  String? token;
  AuthenticationModel({this.token});

  AuthenticationModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}
