import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:nano_board/infrasctructure/security/security_service.dart';
import 'package:nano_board/utils/custom_env.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/src/middleware.dart';

class SecurityServiceImp implements SecurityService<JWT> {
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
  Middleware get auth {
    return (Handler handler) {
      return (Request req) {
        return handler(req);
      };
    };
  }

  @override
  Middleware get verifyJwt => throw UnimplementedError();
}
