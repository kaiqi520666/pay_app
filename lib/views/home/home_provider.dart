import 'package:get/get.dart';
import 'package:pay_app/base/http_base.dart';

import '../../config/app_config.dart';

class HomeProvider extends HttpBase {
  Future<Response> getStats() async {
    return await get('/order/find_stats');
  }

  Future<Response> getOrders(int offset) async {
    return await post(
        '/order/find_orders?offset=$offset&limit=${AppConfig.limit}', null);
  }

  Future<Response> getUser() async {
    return await post('/user/find_user', null);
  }
}
