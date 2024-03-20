import 'package:dis_pred/features/authentication/data/models/authentication_model.dart';
import 'package:dis_pred/features/authentication/data/repository/login_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationModel? authenticationModel;
  String? token;

  Future<bool> postLoginData(
      {required String name, required String password}) async {
    authenticationModel =
        await LoginRepository.loginUser(password: password, uname: name);
    token = authenticationModel?.token ?? '';
    if (token != null && token?.isNotEmpty == true) {
      return true;
    } else {
      return false;
    }
  }
}
