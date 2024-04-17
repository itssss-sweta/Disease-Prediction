import 'package:shared_preferences/shared_preferences.dart';

class CacheServices {
  CacheServices._();
  static final CacheServices _cacheServices = CacheServices._();

  factory CacheServices() => _cacheServices;

  static CacheServices getCacheServicesInstance = _cacheServices;

  static late SharedPreferences sharedPreferences;

  /// Initialize SharedPreferences instance.
  Future<SharedPreferences> initPreferences() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  static String tokenKey = 'token_key';
  static String userNameKey = 'user_name';
  static String loginKey = 'isLogin';

  void saveToken(String token) async {
    await sharedPreferences.setString(tokenKey, token);
  }

  void saveName(String name) async {
    await sharedPreferences.setString(userNameKey, name);
  }

  String? get getName => sharedPreferences.getString(userNameKey);

  String? get getToken => sharedPreferences.getString(tokenKey);

  /// Save boolean value indicating user login status to disk.
  ///
  /// * [value]: The boolean value to save (true for logged in, false for logged out).
  Future<bool> saveIsLogin(bool value) async {
    return await sharedPreferences.setBool(loginKey, value);
  }

  /// Get saved user login status from disk.
  ///
  /// Returns true if the user is logged in, false otherwise.
  bool getIsLogin() => sharedPreferences.getBool(loginKey) ?? false;
}
