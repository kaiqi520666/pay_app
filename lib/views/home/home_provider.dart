import 'package:get/get.dart';
import 'package:pay_app/base/http_base.dart';
import 'package:pay_app/entity/order.entity.dart';

import '../../config/app_config.dart';

class HomeProvider extends HttpBase {
  Future<Response> getStats(String startTime, String endTime) async {
    return await post(
        '/order/find_orders', {'start_time': startTime, 'end_time': endTime});
  }

  Future<Response> getOrders(int offset, QueryOrderEntity query) async {
    late Map<String, String>? params = {};
    if (query.orderId != null && query.orderId!.isNotEmpty) {
      params.addAll({'order_id': query.orderId!});
    }
    if (query.outOrderId != null && query.outOrderId!.isNotEmpty) {
      params.addAll({'out_order_id': query.outOrderId!});
    }
    if (query.startTime != null && query.startTime!.isNotEmpty) {
      params.addAll({'start_time': query.startTime!});
    }
    if (query.endTime != null && query.endTime!.isNotEmpty) {
      params.addAll({'end_time': query.endTime!});
    }
    if (query.status != null && query.status! > 0) {
      params.addAll({'status': query.status.toString()});
    }
    return await post(
        '/order/find_orders?offset=$offset&limit=${AppConfig.limit}', params);
  }

  Future<Response> getUser() async {
    return await post('/user/find_user', null);
  }
}
