import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:get/get.dart';
import 'package:nano_board/infrasctructure/security/api_router_validate.dart';
import 'package:nano_board/infrasctructure/security/security_service.dart';
import 'package:nano_board/utils/custom_env.dart';
import 'package:shelf/shelf.dart' as shelf;

class SecurityServiceImp extends GetxController
    implements SecurityService<JWT> {
  static final SecurityServiceImp instance = Get.find();

  @override
  Future<String> generateJWT(String uid) async {
    var jwt = JWT({
      'iat': DateTime.now().millisecondsSinceEpoch,
      'uid': uid,
    });

    String token = jwt.sign(SecretKey(await CustomEnv.get(key: 'jwt_key')));
    return token;
  }

  @override
  Future<JWT?> validateJWT(String token) async {
    try {
      return JWT.verify(token, SecretKey(await CustomEnv.get(key: 'jwt_key')));
    } on JWTInvalidException {
      return null;
    } on JWTExpiredException {
      return null;
    } on JWTNotActiveException {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  shelf.Middleware get authorization {
    return (shelf.Handler handler) {
      return (shelf.Request req) async {
        String? authorizationHeader = req.headers['Authorization'];

        JWT? jwt;

        if (authorizationHeader != null) {
          if (authorizationHeader.startsWith('Bearer ')) {
            String token = authorizationHeader.substring(7);
            jwt = await validateJWT(token);
          }
        }
        var request = req.change(context: {'jwt': jwt});
        return handler(request);
      };
    };
  }

  @override
  shelf.Middleware get verifyJwt => shelf.createMiddleware(
        requestHandler: (shelf.Request req) {
          if (req.context['jwt'] == null) {
            return shelf.Response.forbidden('Not Authorized');
          }
          return null;
        },
      );
}
