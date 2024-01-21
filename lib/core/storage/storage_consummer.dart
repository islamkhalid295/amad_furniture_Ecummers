abstract class StorageConsumer {
  Future<void> write(String key, dynamic value);
  Future<dynamic> read(String key);
  Future<Map<String, String>> readAll();
  Future<void> delete(String key);
  Future<void> deleteAll();
  Future<void> setToken(String token);
  //remove token
  Future<void> deleteToken();
}