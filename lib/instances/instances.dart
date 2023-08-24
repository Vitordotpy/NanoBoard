import 'package:nano_board/DAOs/userDAO.dart';
import 'package:nano_board/infrasctructure/database/postgres_db_config.dart';
import 'package:nano_board/infrasctructure/security/security_service_imp.dart';
import 'package:postgres/postgres.dart';
import '../controllers/pagecontroller.dart';

CustomPageController pageController = CustomPageController.instance;
UserDAO userDAO = UserDAO.instance;
SecurityServiceImp securityServiceImp = SecurityServiceImp.instance;
Future<PostgreSQLConnection> connection = PostgresDBConfig.instance.connection;
