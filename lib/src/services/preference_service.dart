import 'package:shared_preferences/shared_preferences.dart';

import '../features/profile/models/user.dart';

class PreferenceService {
  Future<SharedPreferences> getInstance() async {
    return SharedPreferences.getInstance();
  }

  Future<String?>? getItem(String key) async {
    final instance = await getInstance();

    return instance.getString(key);
  }

  Future<String?>? getUserId() async {
    return getItem('id');
  }

  Future<bool> addItem(String key, String value) async {
    final instance = await getInstance();

    return instance.setString(key, value);
  }

  Future<bool> clear() async {
    final instance = await getInstance();

    return instance.clear();
  }

  Future<void> saveUser(User user, String token) async {
    final pref = await getInstance();
    pref.setString('id', user.id);
    pref.setString('token', token);
  }
}
