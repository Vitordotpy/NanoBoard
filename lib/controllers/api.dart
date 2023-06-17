import 'package:nano_board/controllers/instances.dart';
import 'package:shelf/shelf.dart';

abstract class Api {
  Handler getHandler({List<Middleware>? middlewares, bool isSecurity = false});
  Handler createHandler({
    required Handler router,
    required List<Middleware>? middlewares,
    bool isSecurity = false,
  }) {
    middlewares ??= [];

    if (isSecurity) {
      middlewares.addAll(
          [securityServiceImp.authorization, securityServiceImp.verifyJwt]);
    }

    var pipeline = Pipeline();

    for (var element in middlewares) {
      pipeline = pipeline.addMiddleware(element);
    }
    return pipeline.addHandler(router);
  }
}
