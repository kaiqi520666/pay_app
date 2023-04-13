import 'package:get/get.dart';
import 'login_controller.dart';
import 'login_provider.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => LoginProvider());
  }
}
