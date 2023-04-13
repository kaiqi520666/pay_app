import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '统计',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: '订单',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: '账变',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '我的',
                ),
              ],
              currentIndex: controller.currentIndex.value,
              selectedItemColor: Colors.amber[800],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            )));
  }
}
