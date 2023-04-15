import 'package:get/get.dart';
import 'package:pay_app/config/app_config.dart';
import 'package:pay_app/services/user_service.dart';

class HttpBase extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.baseUrl;
    httpClient.addRequestModifier<void>((request) {
      var user = Get.find<UserService>().user;
      if (user != null) {
        request.headers['Authorization'] = 'Bearer ${user.token}';
      }
      return request;
    });
    super.onInit();
  }
}
