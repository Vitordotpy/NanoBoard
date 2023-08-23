import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shelf/shelf.dart';
import 'package:window_size/window_size.dart';
import 'package:nano_board/apis/finance_api.dart';
import 'package:nano_board/apis/login_api.dart';
import 'package:nano_board/controllers/pagecontroller.dart';
import 'package:nano_board/infrasctructure/security/security_service_imp.dart';
import 'package:nano_board/utils/custom_env.dart';

import 'DAOs/userDAO.dart';
import 'app.dart';
import 'infrasctructure/server_comunication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Seta o tamanho máximo da janela
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('NanoBoard');
    setWindowMinSize(const Size(800, 600));
    setWindowMaxSize(Size.infinite);
  }

  // Roda a aplicação
  runApp(const MyApp());

  // Inicializando os controllers do GETX
  Get.put(CustomPageController());
  Get.put(UserDAO(
      name: RxString('Lorem Ipsum'),
      password: RxString('12345'),
      email: RxString('email@email.com'),
      uid: RxString('uid'))); // provisório
  Get.put(SecurityServiceImp());

  // Handlers multiplos
  Handler cascade = Cascade()
      .add(LoginApi().getHandler())
      .add(FinanceApi().getHandler(isSecurity: true))
      .handler;

  // Adicionando o cascade e os middleware em um pipeline
  var handler = const Pipeline().addHandler(cascade);

  // Adquirindo dados senvíveis para o ambiente
  CustomEnv.fromFile('.env-dev'); // Muda o ambiente de desenvolvimento

  // Inicializando a comunicação com o servidor
  ServerComunication().initialize(
      handler: handler,
      adress: await CustomEnv.get<String>(key: 'server_adress'),
      port: await CustomEnv.get<int>(key: 'server_port'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NanoBoard',
      home: const App(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder()
      })),
    );
  }
}
