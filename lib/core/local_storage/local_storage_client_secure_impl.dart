import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'local_storage_client.dart';
import 'local_storage_item.dart';
class LocalStorageClientSecureImpl implements LocalStorageClient {
  final _secureStorage = const FlutterSecureStorage();
  @override
  Future<void> clearData() async {
    await _secureStorage.deleteAll();
  }
  @override
  Future<bool> containsKeyData(String key) async {
    return await _secureStorage.containsKey(key: key);
  }
  @override
  Future<void> deleteData(String key) async {
    await _secureStorage.delete(key: key);
  }
  @override
  Future<List<LocalStorageItem>> readAllData() async {
    final allData = await _secureStorage.readAll();
    return allData.entries
        .map((e) => LocalStorageItem(key: e.key, value: e.value))
        .toList();
  }
  @override
  Future<String?> readData(String key) async {
    return await _secureStorage.read(key: key);
  }
  @override
  Future<void> writeData(LocalStorageItem newItem) async {
    await _secureStorage.write(key: newItem.key, value: newItem.value);
  }
}