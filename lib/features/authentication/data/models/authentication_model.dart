class AuthenticationModel {
  String? token;
  String? username;
  AuthenticationModel({this.token, this.username});

  AuthenticationModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    username = json['username'];
  }
}
