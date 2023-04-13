//写一个登录页面,有一个账号和密码输入框,一个登录按钮
//点击登录按钮,调用登录接口,登录成功后,跳转到首页
//登录页面的代码如下
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/W.png',
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: controller.usernameController,
                decoration: const InputDecoration(
                    hintText: '请输入账号', icon: Icon(Icons.person)),
              ),
              const SizedBox(height: 20),
              TextField(
                //密码输入框
                obscureText: true,
                controller: controller.passwordController,
                decoration: const InputDecoration(
                  hintText: '请输入密码',
                  icon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.login();
                  },
                  child: const Text('登录'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
