import 'package:shelf/shelf.dart';

abstract class SecurityService<T> {
  Future<String> generateJWT(String uid);
  Future<T?> validateJWT(String token);

  Middleware get verifyJwt;
  Middleware get auth;
}
