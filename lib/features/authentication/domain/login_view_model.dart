import 'package:dis_pred/core/cache/cache_services.dart';
import 'package:dis_pred/features/authentication/data/models/authentication_model.dart';
import 'package:dis_pred/features/authentication/data/repository/login_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationModel? authenticationModel;
  String? token;
  String? name;

  CacheServices cacheServices = CacheServices();

  Future<bool> postLoginData(
      {required String name, required String password}) async {
    ({AuthenticationModel? authenticationModel, String? error}) response =
        await LoginRepository.loginUser(password: password, uname: name);
    if (response.error != null) {
      token = response.authenticationModel?.token ?? '';
      cacheServices.saveToken(token ?? '');
      name = response.authenticationModel?.username ?? '';
      cacheServices.saveToken(name);
      return true;
    }
    return false;
  }
}
