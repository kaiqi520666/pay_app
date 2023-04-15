import 'package:get/get.dart';
import 'package:pay_app/views/home/home_provider.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeProvider());
  }
}
