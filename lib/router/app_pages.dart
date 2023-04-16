import 'package:get/get.dart';
import 'package:pay_app/views/search/search_binding.dart';
import 'package:pay_app/views/search/search_view.dart';
import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';
import '../views/splash/splash_view.dart';
import '../views/login/login_binding.dart';
import '../views/login/login_view.dart';

import '../views/splash/splash_binding.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const initial = AppRouter.splash;
  static final routes = [
    GetPage(
      name: AppRouter.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRouter.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRouter.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRouter.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    )
  ];
}
