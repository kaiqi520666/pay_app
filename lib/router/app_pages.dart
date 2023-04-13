import 'package:get/get.dart';
import 'package:pay_app/views/home/home_binding.dart';
import 'package:pay_app/views/home/home_view.dart';
import '../views/login/login_binding.dart';
import '../views/login/login_view.dart';

import 'app_routes.dart';

abstract class AppPages {
  static const initial = AppRouter.login;
  static final routes = [
    GetPage(
        name: AppRouter.login,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: AppRouter.home,
        page: () => const HomeView(),
        binding: HomeBinding())
  ];
}
