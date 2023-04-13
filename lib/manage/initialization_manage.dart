import 'package:get/get.dart';
import '../services/user_service.dart';

import '../utils/app_util.dart';

abstract class InitializationManager {
  static Future<void> initialize() async {
    await AppUtil.init();
    await Get.putAsync(() => UserService().init());
  }
}
