import 'package:get/get.dart';
import 'package:nano_board/models/user_model.dart';

class UserDAO extends GetxController {
  static final UserDAO instance = Get.find();
  late Rx<UserModel> user;
}
