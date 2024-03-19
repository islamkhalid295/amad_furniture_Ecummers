import 'package:cedage/core/storage/storage_consummer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class FlutterSecureStorageCnsummer implements StorageConsumer{
  FlutterSecureStorageCnsummer(this.storage);

  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //   encryptedSharedPreferences: true,
  // );
   final FlutterSecureStorage storage  ;

  @override
  Future<void> write(String key, value)  async{
    return await storage.write(key: key, value: value);
  }

  @override
  Future<void> delete(String key) async{
     await storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async{
    return await storage.deleteAll();


  }

  @override
  Future<String?> read(String key) async{
        return await storage.read(key: key,);
  }

  @override
  Future<Map<String, String>> readAll() async{
    return await storage.readAll();

  }

  @override
  Future<void> setToken(String? token) async {
    storage.write(key: 'token', value: token);
  }

  @override
  Future<void> deleteToken() async {
    storage.delete(key: 'token');
  }

  @override
  Future<String?> getToken() {
    return storage.read(key: 'token');
  }
}