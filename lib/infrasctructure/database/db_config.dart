abstract class DBConfig {
  Future<dynamic> createConnection() async {}
  Future<dynamic> get connection;
}
