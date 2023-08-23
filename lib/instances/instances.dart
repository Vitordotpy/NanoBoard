import 'package:nano_board/DAOs/userDAO.dart';
import 'package:nano_board/infrasctructure/security/security_service_imp.dart';

import '../controllers/pagecontroller.dart';

CustomPageController pageController = CustomPageController.instance;
UserDAO userDAO = UserDAO.instance;
SecurityServiceImp securityServiceImp = SecurityServiceImp.instance;
