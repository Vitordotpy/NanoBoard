import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class ServerComunication {
  Future<void> initialize(Handler handler) async {
    String adress = 'localhost';
    int port = 8080;
    await shelf_io.serve(handler, adress, port);
    print('Server started at: http://localhost:8080');
  }
}
