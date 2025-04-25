import 'package:shared_preferences/shared_preferences.dart';

import '../utils/logger.dart';

class PreferenceService {
  PreferenceService() {
    Logger.log('PreferenceService');
  }

  Future<SharedPreferences> getInstance() {
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

  Future<bool> addBool(String key, {required bool value}) async {
    final instance = await getInstance();

    return instance.setBool(key, value);
  }

  Future<bool> getBool(String key) async {
    final instance = await getInstance();

    final value = instance.getBool(key);

    return value ?? false;
  }

  Future<bool> addList(String key, List<String> list) async {
    final instance = await getInstance();

    return instance.setStringList(key, list);
  }

  Future<List<String>> getList(String key) async {
    final instance = await getInstance();

    final list = instance.getStringList(key);
    if (list == null) {
      return <String>[];
    }

    return list;
  }

  Future<bool> clear() async {
    final instance = await getInstance();

    return instance.clear();
  }
}
