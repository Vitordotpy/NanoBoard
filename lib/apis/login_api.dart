import 'package:nano_board/controllers/api.dart';
import 'package:nano_board/controllers/instances.dart';
import 'package:nano_board/controllers/userDAO.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class LoginApi extends Api {
  @override
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false}) {
    final router = Router();

    router.post('/login', (Request request) async {
      var result = await request.readAsString(); // lendo o json da requisição
      var token = await securityServiceImp.generateJWT('1');

      userDAO = UserDAO.fromJson(
          result); // transformando o json resultante em um objeto do tipo UserModel()
      return Response.ok(token);
    });

    return createHandler(
        router: router, isSecurity: isSecurity, middlewares: middlewares);
  }
}
