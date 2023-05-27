import 'package:nano_board/controllers/instances.dart';
import 'package:nano_board/models/transaction_model.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class FinanceApi {
  Handler get handler {
    final router = Router();

    router.post('/user/finance', (Request request) async {
      var result = await request.readAsString(); // lendo o json da requisição
      userDAO.setUserFinances(TransactionModel.fromJson(
          result)); // transformando o json resultante em um objeto do tipo TransactionModel()
      return Response.ok(userDAO.getUserFinances());
    });

    return router;
  }
}
