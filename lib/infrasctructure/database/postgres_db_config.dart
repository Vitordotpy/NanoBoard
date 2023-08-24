import 'package:get/get.dart';
import 'package:nano_board/infrasctructure/database/db_config.dart';
import 'package:nano_board/utils/custom_env.dart';
import 'package:postgres/postgres.dart';

class PostgresDBConfig implements DBConfig {
  static final PostgresDBConfig instance = Get.find();
  PostgreSQLConnection? _connection;

  @override
  Future<PostgreSQLConnection> get connection async {
    // Açúcar sintático: se _connection for nulo ele recebe createConnection()
    _connection ??= await createConnection();
    if (_connection == null) {
      throw Exception();
    }
    return _connection!;
  }

  @override
  Future<PostgreSQLConnection> createConnection() async {
    // Cria conexão a partir dos dados do banco no ambiente customizado
    return PostgreSQLConnection(
        await CustomEnv.get<String>(key: 'db_host'),
        await CustomEnv.get<int>(key: 'db_port'),
        await CustomEnv.get<String>(key: 'db_schema'),
        username: await CustomEnv.get<String>(key: 'db_user'),
        password: await CustomEnv.get<String>(key: 'db_pass'));
  }
}
