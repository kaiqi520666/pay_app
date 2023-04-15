import 'package:get/get.dart';
import 'package:pay_app/services/user_service.dart';

class SplashController extends GetxController {
  var userService = Get.find<UserService>();
  var text = "开始";
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      if (userService.user != null) {
        Get.offNamed('/home');
      } else {
        Get.offNamed('/login');
      }
    });
  }
}
