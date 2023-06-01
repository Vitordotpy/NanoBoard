import 'dart:io';

class CustomEnv {
  // ambiente customizado, recupera informações sensíveis de ambiente através da chave(key)
  static Map<String, String> _map = {};
  static String _env = '.env-dev';

  CustomEnv._();
  factory CustomEnv.fromFile(String file) {
    _env = file;
    return CustomEnv._();
  }

  static Future get({required String key}) async {
    if (_map.isEmpty) await _load();
    return _map[key];
  }

  static Future<void> _load() async {
    List<String> linhas = (await _readFile()).split('\n');
    _map = {for (var l in linhas) l.split('=')[0]: l.split('=')[1]};
  }

  static Future<String> _readFile() async {
    return await File('.env').readAsString();
  }
}
