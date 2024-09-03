import 'package:new_ezagro_flutter/core/local_storage/local_storage_client.dart';
import 'package:new_ezagro_flutter/core/local_storage/local_storage_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageClientSharedPrefsImpl implements LocalStorageClient {
  LocalStorageClientSharedPrefsImpl([this._sharedPreferencesInstance]);

  final SharedPreferences? _sharedPreferencesInstance;

  Future<SharedPreferences> get sharedPreferencesInstance =>
      _sharedPreferencesInstance != null
          ? Future.value(_sharedPreferencesInstance)
          : SharedPreferences.getInstance();

  @override
  Future<void> clearData() async {
    (await sharedPreferencesInstance).clear();
  }

  @override
  Future<bool> containsKeyData(String key) async {
    return (await sharedPreferencesInstance).containsKey(key);
  }

  @override
  Future<void> deleteData(String key) async {
    (await sharedPreferencesInstance).remove(key);
  }

  @override
  Future<List<LocalStorageItem>> readAllData() async {
    final instance = await sharedPreferencesInstance;
    final allKeys = instance.getKeys();
    final allData = <String, dynamic>{};

    for (String key in allKeys) {
      allData[key] = instance.get(key);
    }

    return allData.entries
        .map((e) => LocalStorageItem(key: e.key, value: e.value))
        .toList();
  }

  @override
  Future<String?> readData(String key) async {
    return (await sharedPreferencesInstance).getString(key);
  }

  @override
  Future<void> writeData(LocalStorageItem newItem) async {
    (await sharedPreferencesInstance).setString(newItem.key, newItem.value);
  }
}
