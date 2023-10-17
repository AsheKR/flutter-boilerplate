import 'package:shared_preferences/shared_preferences.dart';


enum ConfigDataEnum {
  replace,
}


class ConfigDataSource {
  const ConfigDataSource({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;
  final SharedPreferences _sharedPreferences;

  Future<void> set({required ConfigDataEnum key, required String value}) async {
    await _sharedPreferences.setString(key.name, value);
  }

  Future<String> get({required ConfigDataEnum key}) async {
    return _sharedPreferences.getString(key.name) ?? '';
  }
}
