import 'package:get/get.dart';
import 'package:pay_app/services/user_service.dart';

class HttpBase extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://192.168.2.16:7001/api';
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
