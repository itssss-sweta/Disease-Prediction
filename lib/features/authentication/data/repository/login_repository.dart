import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:dis_pred/features/authentication/data/models/authentication_model.dart';

class LoginRepository {
  static Future<({AuthenticationModel? authenticationModel, String? error})>
      loginUser({required String uname, required String password}) async {
    AuthenticationModel authenticationModel;
    log('tapped');
    final response = await http.post(
      Uri.parse('https://eye-disease-prediction-xf00.onrender.com/api/login/'),
      body: jsonEncode({
        'username': uname,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    log(response.body);
    log(response.statusCode.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map<String, dynamic> decodedBody = json.decode(response.body);
      authenticationModel = AuthenticationModel.fromJson(decodedBody);
      return (authenticationModel: authenticationModel, error: null);
    }
    return (
      error: 'Unexpected Error Occured! Please try again !',
      authenticationModel: null
    );
  }
}
