class ApiRouterValidate {
  final List<String> _rotas = [];
  ApiRouterValidate add(String route) {
    _rotas.add(route);
    return this;
  }

  bool isPublic(String route) {
    return _rotas.contains(route);
  }
}
