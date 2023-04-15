import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_app/views/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/W.png',
              width: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              '全球领先的支付服务提供商',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/login');
              },
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.text),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.arrow_right_alt)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
