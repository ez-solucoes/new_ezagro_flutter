import 'local_storage_item.dart';

abstract class LocalStorageClient {
  Future<void> writeData(LocalStorageItem newItem);

  Future<String?> readData(String key);

  Future<void> deleteData(String key);

  Future<bool> containsKeyData(String key);

  Future<List<LocalStorageItem>> readAllData();

  Future<void> clearData();
}