import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_app/views/login/login_provider.dart';

class LoginController extends GetxController {
  var loginProvider = Get.find<LoginProvider>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    usernameController.text = 'zhuabc4';
    passwordController.text = 'a123456';
  }

  void login() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('提示', '用户名或密码不能为空',
          icon: const Icon(
            Icons.cancel,
            color: Colors.red,
          ));
      return;
    }
    var response = await loginProvider.login(
        usernameController.text, passwordController.text);
    if (response.body['code'] == 200) {
      Get.offNamed('/home');
    } else {
      Get.snackbar('提示', '登录失败',
          icon: const Icon(
            Icons.cancel,
            color: Colors.red,
          ));
    }
  }
}
