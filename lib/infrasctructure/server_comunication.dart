import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

class ServerComunication {
  Future<void> initialize(
      {required Handler handler,
      required String adress,
      required int port}) async {
    await shelf_io.serve(handler, adress, port);
    print('Server started at: http://localhost:8080');
  }
}
