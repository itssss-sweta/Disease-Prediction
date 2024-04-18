import 'package:dis_pred/core/cache/cache_services.dart';
import 'package:dis_pred/features/authentication/data/models/authentication_model.dart';
import 'package:dis_pred/features/authentication/data/repository/login_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationModel? authenticationModel;
  String? token;
  String? userName;

  CacheServices cacheServices = CacheServices();

  TextEditingController? nameController;
  TextEditingController? passwordController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<bool> postLoginData(
      {required String name, required String password}) async {
    ({AuthenticationModel? authenticationModel, String? error}) response =
        await LoginRepository.loginUser(password: password, uname: name);
    if (response.error == null) {
      token = response.authenticationModel?.token ?? '';
      cacheServices.saveToken(token ?? '');
      userName = response.authenticationModel?.username ?? '';
      cacheServices.saveName(userName ?? "");
      cacheServices.saveIsLogin(true);
      return true;
    } else {
      return false;
    }
  }

  Future<({bool? isAuthentication, bool? successValidation})>?
      validateForm() async {
    if (formKey.currentState?.validate() ?? false) {
      bool isAuthenticated = await postLoginData(
          name: nameController?.text ?? '',
          password: passwordController?.text ?? "");
      return (isAuthentication: isAuthenticated, successValidation: true);
    }
    return (isAuthentication: null, successValidation: false);
  }

  void disposeControllers() {
    nameController?.dispose();
    passwordController?.dispose();
  }
}
