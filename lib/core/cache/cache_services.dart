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

  static const _tokenKey = 'token_key';
  static const _userNameKey = 'user_name';
  static const _loginKey = 'isLogin';

  Future<bool> saveToken(String token) async {
    return await sharedPreferences.setString(_tokenKey, token);
  }

  Future<bool> saveName(String name) async {
    return await sharedPreferences.setString(_userNameKey, name);
  }

  String? get getName => sharedPreferences.getString(_userNameKey);

  String? get getToken => sharedPreferences.getString(_tokenKey);

  /// Save boolean value indicating user login status to disk.
  ///
  /// * [value]: The boolean value to save (true for logged in, false for logged out).
  Future<bool> saveIsLogin(bool value) async {
    return await sharedPreferences.setBool(_loginKey, value);
  }

  /// Get saved user login status from disk.
  ///
  /// Returns true if the user is logged in, false otherwise.
  bool getIsLogin() => sharedPreferences.getBool(_loginKey) ?? false;

  Future<void> clearCacheData() async {
    await sharedPreferences.clear();
    saveIsLogin(false);
  }
}
