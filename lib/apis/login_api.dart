import 'package:nano_board/controllers/instances.dart';
import 'package:nano_board/controllers/userDAO.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class LoginApi {
  Handler get handler {
    final router = Router();

    router.post('/login', (Request request) async {
      var result = await request.readAsString(); // lendo o json da requisição

      userDAO = UserDAO.fromJson(
          result); // transformando o json resultante em um objeto do tipo UserModel()
      return Response.ok(userDAO.toJson());
    });

    return router;
  }
}
