import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pay_app/views/home/widget/stats_widget.dart';
import 'home_controller.dart';
import 'widget/account_change_widget.dart';
import 'widget/my_widget.dart';
import 'widget/order_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
          controller: controller.pageController,
          onPageChanged: ((value) => controller.currentIndex.value = value),
          children: [
            StatsWidget(controller: controller),
            OrderWidget(controller: controller),
            AccountChangeWidget(controller: controller),
            MyWidget(controller: controller),
          ],
        )),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/stats.svg',
                    width: 25,
                  ),
                  label: '统计',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/order.svg',
                    width: 25,
                  ),
                  label: '订单',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/account_change.svg',
                    width: 25,
                  ),
                  label: '账变',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/user.svg',
                    width: 25,
                  ),
                  label: '我的',
                ),
              ],
              currentIndex: controller.currentIndex.value,
              selectedItemColor: Colors.green,
              onTap: (value) => controller.pageController.animateToPage(value,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease),
            )));
  }
}
