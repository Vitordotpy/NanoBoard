import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_board/apis/finance_api.dart';
import 'package:nano_board/apis/login_api.dart';
import 'package:nano_board/controllers/pagecontroller.dart';
import 'package:nano_board/controllers/userDAO.dart';
import 'package:nano_board/utils/custom_env.dart';
import 'package:shelf/shelf.dart';
import 'package:window_size/window_size.dart';

import 'app.dart';
import 'infrasctructure/server_comunication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('NanoBoard');
    setWindowMinSize(const Size(800, 600));
    setWindowMaxSize(Size.infinite);
  }
  runApp(const MyApp());
  Get.put(CustomPageController());
  Get.put(UserDAO(
      name: RxString('Lorem Ipsum'),
      password: RxString('12345'),
      email: RxString('email@email.com'),
      uid: RxString('uid'))); // provisório
  Handler cascade =
      Cascade().add(LoginApi().handler).add(FinanceApi().handler).handler;
  CustomEnv.fromFile('.env-dev'); // Muda o ambiente de desenvolvimento
  ServerComunication().initialize(
      handler: cascade,
      adress: await CustomEnv.get(key: 'server_adress') as String,
      port: await CustomEnv.get(key: 'server_port') as int);
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
