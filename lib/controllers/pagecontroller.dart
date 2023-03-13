import 'package:get/get.dart';

class CustomPageController extends GetxController {
  static final CustomPageController instance = Get.find();
  RxString currentPage = "Home".obs;
}
