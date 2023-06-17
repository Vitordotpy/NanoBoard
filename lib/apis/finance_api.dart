import 'package:nano_board/controllers/api.dart';
import 'package:nano_board/controllers/instances.dart';
import 'package:nano_board/models/transaction_model.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class FinanceApi extends Api {
  @override
  Handler getHandler({
    List<Middleware>? middlewares,
    bool isSecurity = false,
  }) {
    final router = Router();

    // create finance
    router.post('/user/finance', (Request request) async {
      var result = await request.readAsString(); // lendo o json da requisição
      userDAO.setUserFinances(TransactionModel.fromJson(
          result)); // transformando o json resultante em um objeto do tipo TransactionModel()
      return Response.ok(userDAO.getUserFinances());
    });

    // get finances
    router.get('/user/finance', (Request request) async {
      var result = await request.readAsString(); // lendo o json da requisição
      userDAO.setUserFinances(TransactionModel.fromJson(
          result)); // transformando o json resultante em um objeto do tipo TransactionModel()
      return Response.ok(userDAO.getUserFinances());
    });

    // update finance
    router.put('/user/finance', (Request request) async {
      var result = await request.readAsString(); // lendo o json da requisição
      String? id = request.url.queryParameters['id'];
      userDAO.setUserFinances(TransactionModel.fromJson(
          result)); // transformando o json resultante em um objeto do tipo TransactionModel()

      return Response.ok(userDAO.getUserFinances());
    });

    // delete a finance
    router.delete('/user/finance', (Request request) async {
      var result = await request.readAsString(); // lendo o json da requisição
      String? id = request.url.queryParameters['id'];
      userDAO.setUserFinances(TransactionModel.fromJson(
          result)); // transformando o json resultante em um objeto do tipo TransactionModel()

      return Response.ok(userDAO.getUserFinances());
    });

    return createHandler(
        router: router, isSecurity: isSecurity, middlewares: middlewares);
  }
}
